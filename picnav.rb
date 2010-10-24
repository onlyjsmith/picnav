class Picnav
  attr_accessor :image_urls, :doc, :output, :from, :to
  
  def initialise(*url)
    @urls = [] 
    list = File.open('url_list').each do |url|
      puts url
      doc = Nokogiri::HTML(open(url))  
      @urls.push(doc)
    end
  end

  def collate_image_urls
    @image_urls = []
    @urls.each do |doc|
      
      doc.xpath('//img').each do |img|
        extract = img['src'].scan(/(?:http|https):\/\/[a-z0-9]+(?:[\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(?:(?::[0-9]{1,5})?\/[^\s]*)?/ix)
        unless extract == [] 
          @image_urls.push(extract[0])
        end
      end
    end
  end

  def delete_src_images
    dir = "public/src_imgs/"
    Dir.foreach(dir) do |f|
      if f == '.' or f == '..' then next
      # elsif File.directory?(f) then FileUtils.rm_rf(f)
      # else puts f.inspect
      else FileUtils.rm( dir + f )
      end
    end
  end

  def save_images
    count = 0
    @image_urls.each do |url|
      urlpath = url
      filepath = 'public/src_imgs/img'+count.to_s+'.jpg'
      File.open(filepath, 'w') do |output|
        if open(urlpath)
          open(urlpath) do |input|
            output << input.read
          end
        end
      end
        count += 1
    end
  end
  
  def show_images
    dir = "public/src_imgs/"
    @output = []
    Dir.foreach(dir) do |f|
      if f == '.' or f == '..' then next
      else 
        g = "<img src='src_imgs/#{f}'/>\n"
        @output.push(g.to_s)
      end
    end
    @output
    # output = "<a href = "
  end
  
end

