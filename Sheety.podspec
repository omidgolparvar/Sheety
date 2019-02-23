Pod::Spec.new do |s|
  s.name                  = 'Sheety'
  s.version               = '0.1'
  s.summary               = 'Sheety framework for Swift.'
  s.description           = <<-DESC
                            Written in Swift.
                            My Sheety Framework.
                            DESC
  s.homepage              = 'https://github.com/omidgolparvar/Sheety'
  s.license               = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author                = { 'Omid Golparvar' => 'iGolparvar@gmail.com' }
  s.source                = { :git => "https://github.com/omidgolparvar/Sheety.git", :tag => s.version.to_s }
  s.swift_version         = '4.2'
  s.platform              = :ios, '10.0'
  s.requires_arc          = true
  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '4.2' }

  s.source_files = [
    'Sheety/*.{h,swift}',
    'Sheety/**/*.swift',
    'Sheety/**/*.xib',
    'Sheety/**/*.storyboard',
  ]
  
  s.public_header_files = 'Sheety/*.h'

  s.libraries  = "z"
  
end
