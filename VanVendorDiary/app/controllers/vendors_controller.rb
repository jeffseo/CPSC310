class VendorsController < ApplicationController
  def index
    
  end


  def import
    @vendor = Vendor.import(params[:file])
    redirect_to :controller=>'vendors', :action =>'show', :id=>'import', :notice=>'vendors imported'
  end

  def show
    @vendors = Vendor.order(:key)
  end
end

