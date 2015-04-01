class HistoryEntriesController < ApplicationController
  # before_action :set_history_entry, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: :create

  # @history_entries = HistoryEntry.all

  # GET /history_entries/1
  # GET /history_entries/1.json
  def show
  end

  # POST /history_entries
  # POST /history_entries.json
  def create
    @vendor = Vendor.find(params[:vendor_id])
    if @vendor
      @history_entry = HistoryEntry.new(history_entry_params)
      @history_entry.user = current_user
      @history_entry.date_time = DateTime.now

      if @history_entry.save
        flash[:success] = "Checked in successfully!"
      end
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
      params.require(:history_entry).permit(:date_time)
    end
end
