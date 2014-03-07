class Affirmation < ActiveRecord::Base
  belongs_to :affirmer, class_name: 'User'
  belongs_to :goal

  validates :owner,         presence: true
  validates :reason,        presence: true
end
