class Affirmation < ActiveRecord::Base
  belongs_to :affirmer, class_name: 'User'
  belongs_to :goal

  validates :affirmer, presence: true
  validates :reason,   presence: true
  validates :affirmer,
    uniqueness: { scope: :goal, message: 'You can only affirm once' }
end
