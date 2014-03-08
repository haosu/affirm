class Post < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :goal

  validates :owner,   presence: true
  validates :goal,    presence: true
  validates :content, presence: true
end
