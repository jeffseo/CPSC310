class HistoryEntriesController < ApplicationController
  # before_action :set_history_entry, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]

  # @history_entries = HistoryEntry.all

  def create
    @vendor = Vendor.find(params[:vid])

    if @vendor
      @history_entry = HistoryEntry.new
      @history_entry.user = current_user
      @history_entry.vendor = @vendor
      @history_entry.date_time = DateTime.now

      if @history_entry.save
        flash[:success] = "Checked in successfully!"
      end
      redirect_to @vendor
    else
      redirect_to root_url, :alert => "You can't check in."
    end
  end

  def destroy
    @history_entry.destroy
    flash[:success] = "History entry deleted"
    redirect_to request.referrer || root_url
  end

  private
    def set_history_entry
      @history_entry = HistoryEntry.find(params[:id])
    end

    def history_entry_params
      params.require(:history_entry).permit(:date_time, :user_id, :vendor_id)
    end
end
