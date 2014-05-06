class KarmaPoint < ActiveRecord::Base
  after_create :update_user_total
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  def update_user_total
    user.update_karma!(value)
  end
end
