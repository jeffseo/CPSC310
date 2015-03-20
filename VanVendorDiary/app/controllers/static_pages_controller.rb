class StaticPagesController < ApplicationController
  def home
    @vendors = Vendor.autoimport
  end

  def help
  end
  
  def about
  end
  
  def contact
  end

end
