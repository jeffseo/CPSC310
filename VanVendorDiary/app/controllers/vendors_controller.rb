class VendorsController < ApplicationController
  def index
   @vendors = Vendor.paginate(page: params[:page]) 
  end

  def import
    @vendor = Vendor.import(params[:file])
    flash[:success] = "file imported"
    redirect_to :controller=>'vendors', :action =>'index'
  end

  def show
    @vendor = Vendor.find(params[:id])
    @comments = @vendor.comments.paginate(page: params[:page])
  end
  
  def new
    @vendor = Vendor.new
  end
  
  def create
    @vendor = Vendor.new(vendor_params)
  end

  def display
    @vendors = Vendor.order(:key)
    @vmarkers = Vendor.select("business_name", "location", "description", "lat", "lon")
    gon.vendors = @vmarkers
  end
  
  private
  
    def vendor_params
      params.require(:vendor).permit(:key, :business_name, :location, :description, :lat, :lon)
    end
end
