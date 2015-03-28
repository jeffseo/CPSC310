class VendorsController < ApplicationController
  before_action :logged_in_user, only: [:index, :update, :import, :autoimport]
  def index
   @vendors = Vendor.paginate(page: params[:page]) 
  end
  
  def show
    @vendor = Vendor.find(params[:id])
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

  def autoimport
    @vendors = Vendor.autoimport
    flash[:success] = "database downloaded"
    redirect_to :controller=>'static_pages', :action =>'home'
  end

  private

    def vendor_params
      params.require(:vendor).permit(:key, :business_name, :location, :description, :lat, :lon)
    end
end