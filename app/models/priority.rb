class Priority < ActiveRecord::Base
  
  validates :content, presence: true
  validates :content, length: { in: 9..250 }
  
  belongs_to :user
  
  default_scope { order(high: :desc, created_at: :desc)}
  
  scope :active_by_user, ->(user) { where(complete: false, :user_id => user) }
  
  def toggle_urgent
    high = !self.high
  end
end
