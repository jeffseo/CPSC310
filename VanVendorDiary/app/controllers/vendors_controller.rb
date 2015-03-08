class VendorsController < ApplicationController
  def index
    
  end

  def import
    Vendor.import(params[:file])
    redirect_to :action => "show", notice: "products imported."
  end

  def show
    @vendors = Vendor.order(:key)
  end
end

