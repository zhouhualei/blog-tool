IMG_PREFIX_PATTERN = /leanote.*fileId=/
IMG_SUFFIX_PATTERN = /\)/
IMG_PREFIX = "/img/"
IMG_SUFFIX = ".png)"

Dir.chdir("raw")
Dir["*"].each do |raw_filename|
  new_filename = "../new/#{raw_filename}"
  new_file = File.new(new_filename, "w")

  # add meta info
  new_file.write("title: \n")
  new_file.write("date: #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}\n")
  new_file.write("category: \n")
  new_file.write("tags: \n")
  new_file.write("---\n")


  File.read(raw_filename).lines.each do |line| 
    if line.match(IMG_PREFIX_PATTERN) != nil
      # puts line
      line.gsub!(IMG_PREFIX_PATTERN, IMG_PREFIX)
      line.gsub!(IMG_SUFFIX_PATTERN, IMG_SUFFIX) 
    end
    new_file.write(line)
  end

  # add wechat qrcode

  new_file.close
end
