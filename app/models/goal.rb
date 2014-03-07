class Goal < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :affirmations

  validates :owner,         presence: true
  validates :name,          presence: true
  validates :reason,        presence: true
  validates :critical_mass, presence: true
end
