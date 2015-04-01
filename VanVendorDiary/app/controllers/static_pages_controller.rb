class StaticPagesController < ApplicationController
  def home
    @vendors = Vendor.autoimport
    if params[:search]
      @vendors = Vendor.search(params[:search])
    else
      @vendors = Vendor.order(:key)
    end
    @list_vendors = @vendors
    gon.vendors = @vendors
  end

  def help
  end

  def about
  end

  def contact
  end

end
