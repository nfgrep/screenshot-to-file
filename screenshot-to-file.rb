require 'tmpdir'
require 'rtesseract'

text_fpath = File.expand_path(ARGV[0])

Dir.mktmpdir do |dir|
  img_fpath = File.join(dir, 'screenshot')
  `screencapture -i #{img_fpath}`
  captured_string = RTesseract.new(img_fpath).to_s
  File.open(text_fpath, 'w') do |file|
    file.write(captured_string)
  end 
end

