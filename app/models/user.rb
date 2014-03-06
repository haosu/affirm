class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :goals, foreign_key: :owner_id
  has_many :affirmations, foreign_key: :affirmer_id

  def set_default_role
    self.role ||= :user
  end

end
