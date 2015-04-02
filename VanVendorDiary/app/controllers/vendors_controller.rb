class VendorsController < ApplicationController
  before_action :logged_in_user, only: [:index, :update, :import, :autoimport]
  def index
    if params[:search]
      @vendors = Vendor.search(params[:search]).paginate(page: params[:page]) 
    else 
      @vendors = Vendor.paginate(page: params[:page]) 
    end
  end
  
  def show
    @vendor = Vendor.find(params[:id])
    gon.vendors = @vendor
    @comment = current_user.comments.build if logged_in?
    @comments = @vendor.comments.paginate(page: params[:page])
  end

  def new
    @vendor = Vendor.new
  end

  def update
  end

  def import
    @vendor = Vendor.import(params[:file])
    flash[:success] = "file imported"
    redirect_to :controller=>'vendors', :action =>'index'
  end

  def create
    @vendor = Vendor.new(vendor_params)
  end

  def display
    @vendors = Vendor.order(:key)
    @vmarkers = Vendor.select("business_name", "location", "description", "lat", "lon")
    gon.vendors = @vmarkers
  end

  def search
    @vendors = Vendor.search(params[:search])
  end

  def autoimport
    @vendors = Vendor.autoimport
    flash[:success] = "database downloaded"
  end

  private
    def vendor_params
      params.require(:vendor).permit(:key, :business_name, :location, :description, :lat, :lon)
    end
end
