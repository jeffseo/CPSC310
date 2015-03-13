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
  end

  def display
    @vendors = Vendor.order(:key)
  end
end

