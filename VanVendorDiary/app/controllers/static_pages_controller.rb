class StaticPagesController < ApplicationController
  def home
    @vendor = Vendor.order(:key)
    @vmarkers = Vendor.select("business_name", "location", "description", "lat", "lon")
    gon.vendors = @vmarkers
  end

  def help
    end

  def about
  end

  def contact
  end

end
