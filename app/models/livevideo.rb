class Livevideo < ActiveRecord::Base
  validates :information, presence: true, length: { maximum: 20 }
  validates :location, presence: true
  validates :url, presence: true, uniqueness: true
  default_scope -> { order('created_at DESC') }
end
