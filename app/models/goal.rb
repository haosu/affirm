class Goal < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :goals
  has_many :affirmations
  has_many :affirmers, through: :affirmations
  has_many :posts

  validates :owner,         presence: true
  validates :name,          presence: true
  validates :reason,        presence: true
  validates :critical_mass, presence: true

  def can_affirm_by?(user)
    !(owner == user || affirmed_by?(user))
  end

  def affirmed_by?(user)
    affirmers.include?(user)
  end
end
