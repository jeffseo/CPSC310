class StaticPagesController < ApplicationController
  def home
    @vendors = Vendor.autoimport
    if params[:search]
        @vendors = Vendor.search(params[:search])
    else
        @vendors = Vendor.order(:key)
    end
    @list_vendors = @vendors
    @vmarkers = @vendors.select("business_name", "location", "description", "lat", "lon")
    gon.vendors = @vmarkers
  end

  def help
  end

  def about
  end

  def contact
  end

end
