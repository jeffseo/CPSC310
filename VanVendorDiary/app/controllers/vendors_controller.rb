class VendorsController < ApplicationController
  def index
    
  end


  def import
    Vendor.import(params[:file])
    #redirect_to :action => "show", notice: "vendors imported."
    redirect_to :controller=>'vendors', :action =>'show', :id=>'import', :notice=>'vendors imported'
  end

  def show
    @vendors = Vendor.order(:key)
  end
end

