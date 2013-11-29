class Video < ActiveRecord::Base
  default_scope -> {order ('created_at DESC')}
  validates :videoinfo, presence: true, length: { maximum: 10 }
end
