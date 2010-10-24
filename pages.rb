class Pages
  def start
    p = Picnav.new

    get '/' do
      erb %{
       <a href="/initialise">Re-Initialise</a></br>
       <a href="/show_images">Show images</a>
      }
    end
    
    get '/initialise' do
      p.delete_src_images && gp.initialise && p.collate_image_urls && p.save_images
    end

    get '/delete' do
      "About to delete..."
      p.delete_src_images
      "Deleted files!"
    end

    get '/show_images' do
      p.show_images
      # erb %{
      #   <html lang="en-US" xml:lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
      #   <head></head>
      #   #{p.output.to_s}
      #   </html>
      # }
    end
    
    get '/link/:a' do
      
    end
  end
end