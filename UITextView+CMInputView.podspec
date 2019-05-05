Pod::Spec.new do |s|
    s.name         = 'UITextView+CMInputView'
    s.version      = '0.1.0'
    s.summary      = 'A category that can configure the UITextView'
    s.homepage     = 'https://github.com/CrabMen/CMInputView'
    s.license      = 'MIT'
    s.authors      = {'CrabMan' => 'tobecrabman@163.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/CrabMen/CMInputView.git', :tag => s.version}
    s.source_files = '**/Class/*.{h,m}'
    s.requires_arc = true
end
