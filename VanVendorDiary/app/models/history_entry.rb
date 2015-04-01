class HistoryEntry < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }

  belongs_to :user
  has_one :vendor

  validates :user_id, presence: true
  validates :vendor_id, presence: true
end
