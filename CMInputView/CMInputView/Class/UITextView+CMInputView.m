//
//  UITextView+CMInputView.m
//  CMInputView
//
//  Created by 智借iOS on 2019/4/28.
//  Copyright © 2019 CrabMan. All rights reserved.
//

#import "UITextView+CMInputView.h"
#import <objc/runtime.h>
@interface UITextView ()


@property (nonatomic,strong) UITextView *placeHolderTextView;

/**最大高度*/
@property (nonatomic,assign) CGFloat maxHeight;



@end

@implementation UITextView (CMInputView)

+ (NSArray *)observingKeys {
    return @[@"attributedText",
             @"bounds",
             @"font",
             @"frame",
             @"text",
             @"textAlignment",
             @"textContainerInset",
             @"textContainer.exclusionPaths"];
}

- (NSString *)cm_placeholder {
    
    return objc_getAssociatedObject(self, @selector(cm_placeholder));

}


- (void)setCm_placeholder:(NSString *)cm_placeholder {
    
    objc_setAssociatedObject(self, @selector(cm_placeholder), cm_placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self placeHolderTextView];
    
}

- (NSAttributedString *)cm_attributedPlaceholder {
    
  return objc_getAssociatedObject(self, @selector(cm_attributedPlaceholder));
    
    
}

- (void)setCm_attributedPlaceholder:(NSAttributedString *)cm_attributedPlaceholder {
    
     objc_setAssociatedObject(self, @selector(cm_attributedPlaceholder), cm_attributedPlaceholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}


- (UIColor *)cm_placeholderColor {
    
    return objc_getAssociatedObject(self, @selector(cm_placeholderColor));
    
}


- (void)setCm_placeholderColor:(UIColor *)cm_placeholderColor {
    
    objc_setAssociatedObject(self, @selector(cm_placeholderColor), cm_placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self placeHolderTextView];

}

- (UIFont *)cm_placeholderFont {
    
    
    return objc_getAssociatedObject(self, @selector(cm_placeholderFont));
    
}

- (void)setCm_placeholderFont:(UIFont *)cm_placeholderFont {
    
    
     objc_setAssociatedObject(self, @selector(cm_placeholderFont), cm_placeholderFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self placeHolderTextView];

}


- (NSUInteger)cm_maxNumberOfLines {
     return [objc_getAssociatedObject(self, @selector(cm_maxNumberOfLines)) integerValue];
    
    
}

- (void)setCm_maxNumberOfLines:(NSUInteger)cm_maxNumberOfLines {
    
     objc_setAssociatedObject(self, @selector(cm_maxNumberOfLines), @(cm_maxNumberOfLines), OBJC_ASSOCIATION_ASSIGN);
    
    [self placeHolderTextView];

}

- (CGFloat)maxHeight {
    
    return [objc_getAssociatedObject(self, @selector(maxHeight)) doubleValue];
    
}

- (NSUInteger)cm_maxTextLength {
    
     return [objc_getAssociatedObject(self, @selector(cm_maxTextLength)) integerValue];
}

- (void)setCm_maxTextLength:(NSUInteger)cm_maxTextLength {
    
     objc_setAssociatedObject(self, @selector(cm_maxTextLength), @(cm_maxTextLength), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)cm_autoLineBreak {
     return [objc_getAssociatedObject(self, @selector(cm_autoLineBreak)) boolValue];
    
}

- (void)setCm_autoLineBreak:(BOOL)cm_autoLineBreak {
    
     objc_setAssociatedObject(self, @selector(cm_autoLineBreak), @(cm_autoLineBreak), OBJC_ASSOCIATION_ASSIGN);
    [self placeHolderTextView];

}




- (UITextView *)placeHolderTextView {
 
    UITextView *placeHolderTextView = objc_getAssociatedObject(self, @selector(placeHolderTextView));
    
    if (!placeHolderTextView) {
        self.text = @"";
        placeHolderTextView = [UITextView new];
        placeHolderTextView.userInteractionEnabled = NO;
        placeHolderTextView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
        objc_setAssociatedObject(self, @selector(placeHolderTextView), placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        
        [self insertSubview:placeHolderTextView atIndex:0];
        
        [self textViewValueChanged];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewValueChanged) name:UITextViewTextDidChangeNotification object:self];
        
        for (NSString *key in self.class.observingKeys) {
            [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
        }

    }
    
    return placeHolderTextView;
    
}


- (void)fontValueChanged {
    
//    CGFloat height =  ceil(self.font.lineHeight * cm_maxNumberOfLines +  self.textContainerInset.top + self.textContainerInset.bottom);
//
//    objc_setAssociatedObject(self, @selector(maxHeight), @(cm_maxNumberOfLines), OBJC_ASSOCIATION_ASSIGN);
//
    
}


- (void)textViewValueChanged {

       self.placeHolderTextView.hidden = self.text.length;
    
    if(!self.text.length) {
    
        self.placeHolderTextView.text= self.cm_placeholder;
    self.placeHolderTextView.textColor = self.cm_placeholderColor ?: [UIColor lightGrayColor];
    self.placeHolderTextView.font = self.cm_placeholderFont?:self.font;
    
        if (self.cm_attributedPlaceholder.length) {
            self.placeHolderTextView.attributedText = self.cm_attributedPlaceholder;
        }
        self.placeHolderTextView.textContainer.exclusionPaths = self.textContainer.exclusionPaths;
        
        self.placeHolderTextView.textAlignment = self.textAlignment;
        self.placeHolderTextView.frame = self.bounds;
    
    }
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {

    [self textViewValueChanged];
}


@end
