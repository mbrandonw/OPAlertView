Pod::Spec.new do |spec|
  spec.name         = 'OPAlertView'
  spec.version      = '0.1.0'
  spec.license      = { type: 'BSD' }
  spec.homepage     = 'https://github.com/mbrandonw/OPAlertView'
  spec.authors      = { 'Brandon Williams' => 'mbw234@gmail.com' }
  spec.summary      = ''
  spec.source       = { :git => 'https://github.com/mbrandonw/OPAlertView.git' }
  spec.source_files = 'src/*.{h,m}'
  spec.requires_arc = true
end
