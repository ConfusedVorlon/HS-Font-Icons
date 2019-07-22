Pod::Spec.new do |s|
  s.name = 'HS-Font-Icons'
  s.version = '0.2.0'
  s.swift_version = '5.0'
  s.license = 'MIT'
  s.summary = 'Font icons. Easy to use icons that look perfect at any scale'
  s.description = <<-DESC
                     Use font icons instead of images
                     Google Material Design Icons 3.0.1
                     Font Awesome 5.0
                     Easy to add new fonts if you like
                     Easy use for buttons, labels, etc
                     Generate images if you must!
                   DESC
  s.homepage = 'https://github.com/ConfusedVorlon/HS-Google-Material-Design-Icons'
  s.screenshots = "https://raw.githubusercontent.com/ConfusedVorlon/HS-Google-Material-Design-Icons/master/resources/image1.png"
  s.authors = "Rob Jonson" , "Patrik Vaberer"
  s.source = { :git => 'https://github.com/ConfusedVorlon/HS-Google-Material-Design-Icons.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.source_files   = ['Source/*.swift']
  s.frameworks = 'UIKit', 'CoreText'
  s.requires_arc = true

  s.default_subspecs = 'GMD','FARegular','FASolid','FABrand'

  s.subspec 'GMD' do |sub|
      sub.source_files = 'Source/GMD/*.swift'
      sub.resource_bundle = { 'MaterialIcons-Regular' => 'Source/GMD/GMDIcons.ttf' }
  end

  s.subspec 'FARegular' do |sub|
      sub.source_files = 'Source/FARegular/*.swift'
      sub.resource_bundle = { 'FontAwesome5FreeRegular' => 'Source/FARegular/*.ttf' }
  end

  s.subspec 'FASolid' do |sub|
      sub.source_files = 'Source/FASolid/*.swift'
      sub.resource_bundle = { 'FontAwesome5FreeSolid' => 'Source/FASolid/*.ttf' }
  end

  s.subspec 'FABrand' do |sub|
      sub.source_files = 'Source/FABrands/*.swift'
      sub.resource_bundle = { 'FontAwesome5BrandsRegular' => 'Source/FABrands/*.ttf' }
  end

end
