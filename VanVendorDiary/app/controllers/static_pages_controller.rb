class StaticPagesController < ApplicationController
  def home
    @vendors = Vendor.test
  end

  def help
  end
  
  def about
  end
  
  def contact
  end

end
