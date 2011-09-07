class GalleryController < ApplicationController
  
  layout 'gallery'
  
  def index
    @items = Item.all
  end
  
  def about
  end
  
  def contact
  end

end
