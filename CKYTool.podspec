Pod::Spec.new do |s|

  s.name         = "CKYTool"
  s.version      = "0.0.1"
  s.summary      = "CKYTool."

  s.description  = <<-DESC
    对这个pod文件进行描述，这的描述要比summary的长。~~~~~~~~~~~~~~~~~~~~~~~~~
                   DESC

  s.homepage     = "https://github.com/Cuidawang/CKYTool"
  s.license      = "MIT"

  s.author       = { "Cuikeyi" => "https://github.com/Cuidawang/CKYTool" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Cuidawang/CKYTool.git", :tag => "#{s.version}" }
  s.header_dir   = "CKYTools"
  s.requires_arc = true

  s.subspec 'XHCCategories' do |ss|
    ss.header_dir   = 'XHCCategories'

    ss.subspec 'NSDate' do |sss|
      sss.source_files = "XHCTools/XHCCategories/NSDate/**/*.{h,m}",
      sss.header_dir = 'NSDate'
    end

    ss.subspec 'NSString' do |sss|
      sss.source_files = "XHCTools/XHCCategories/NSString/**/*.{h,m}",
      sss.header_dir = 'NSString'
    end

    ss.subspec 'NSDate' do |sss|
      sss.source_files = "XHCTools/XHCCategories/NSDate/**/*.{h,m}",
      sss.header_dir = 'NSDate'
    end

    ss.subspec 'UIButton' do |sss|
      sss.source_files = "XHCTools/XHCCategories/UIButton/**/*.{h,m}",
      sss.header_dir = 'UIButton'
    end

    ss.subspec 'UIColor' do |sss|
      sss.source_files = "XHCTools/XHCCategories/UIColor/**/*.{h,m}",
      sss.header_dir = 'UIColor'
    end

    ss.subspec 'UIImage' do |sss|
      sss.source_files = "XHCTools/XHCCategories/UIImage/**/*.{h,m}",
      sss.header_dir = 'UIImage'
    end

    ss.subspec 'UIView' do |sss|
      sss.source_files = "XHCTools/XHCCategories/UIView/**/*.{h,m}",
      sss.header_dir = 'UIView'
    end

    # ss.source_files = "XHCTools/XHCCategories/**/*.{h,m}",
  end

  s.subspec 'XHCFileManager' do |ss| 
    ss.source_files = "XHCTools/XHCFileManager/**/*.{h,m}",
    ss.header_dir   = 'XHCFileManager'
  end

end
