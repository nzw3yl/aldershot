class Stuck < ActiveRecord::Base
  
  validates :content, presence: true
  validates :content, length: { in: 9..250 }
  
  belongs_to :user
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  
  default_scope { order(created_at: :desc)}
  
  scope :active_by_user, ->(user) { where(complete: false, :user_id => user) }
  scope :active_blocks, ->(user) { where(complete: false, :owner_id => user) }
  
end
