class Pages
  def start
    p = Picnav.new
    # TODO: Add function to select multiple images at the same time?

    get '/' do
      erb %{
       <a href="/initialise">Re-Initialise</a></br>
       <a href="/show_images">Show images</a>
      }
    end
    
    get '/initialise' do
      p.delete_src_images && p.initialise && p.collate_image_urls && p.save_images
    end

    get '/delete' do
      "About to delete..."
      p.delete_src_images
      "Deleted files!"
    end

    get '/show_images' do
      p.show_images
    end
    
    get '/link/:a' do
      "Linked to 1"
      # TODO: Make these links link to something!
    end
  end
end