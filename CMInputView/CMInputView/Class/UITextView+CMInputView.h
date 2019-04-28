//
//  UITextView+CMInputView.h
//  CMInputView
//
//  Created by 智借iOS on 2019/4/28.
//  Copyright © 2019 CrabMan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (CMInputView)


@property (nonatomic,copy) NSString *cm_placeholder;

@property (nonatomic,copy) NSAttributedString *cm_attributedPlaceholder;

@property (nonatomic,copy) UIColor *cm_placeholderColor;


@property (nonatomic,strong) UIFont *cm_placeholderFont;


@property (nonatomic,assign) NSUInteger cm_maxNumberOfLines;


@property (nonatomic,assign) NSUInteger cm_maxTextLength;


@property (nonatomic,assign) BOOL cm_autoLineBreak;



@end

NS_ASSUME_NONNULL_END
