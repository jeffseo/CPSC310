class VendorsController < ApplicationController
  def index
  end

  def import
    Vendor.import(params[:file])
    redirect_to :controller=>'vendors', :action =>'show', :id=>'import', :notice=>'vendors imported'
  end

  def show
    @vendors = Vendor.order(:key)
    @vmarkers = Vendor.select("business_name", "description", "lat", "lon")
    gon.vendors = @vmarkers
  end
end
