class HistoryEntry < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }

  belongs_to :user
  belongs_to :vendor

  validates :user_id, presence: true
  validates :vendor_id, presence: true
  validates :date_time, presence: true
end
