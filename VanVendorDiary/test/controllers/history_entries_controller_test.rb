require 'test_helper'

class HistoryEntriesControllerTest < ActionController::TestCase
  setup do
    @history_entry = history_entries(:one)
  end

  # test "should create history_entry" do
  #   assert_difference('HistoryEntry.count') do
  #     post :create, history_entry: { date_time: @history_entry.date_time }
  #   end
  #
  #   assert_redirected_to history_entry_path(assigns(:history_entry))
  # end

  # test "should show history_entry" do
  #   get :show, id: @history_entry
  #   assert_response :success
  # end

  # test "should destroy history_entry" do
  #   assert_difference('HistoryEntry.count', -1) do
  #     delete :destroy, id: @history_entry
  #   end
  #
  #   assert_redirected_to history_entries_path
  # end
end
