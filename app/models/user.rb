class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         omniauth_providers: [:facebook]

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :goals, foreign_key: :owner_id
  has_many :affirmations, foreign_key: :affirmer_id

  def set_default_role
    self.role ||= :user
  end

  def self.find_for_facebook_oauth(auth)
    auth[:email] = auth.info.email

    user = where(auth.slice(:provider, :uid, :email)).first

    return user if user

    user = where(auth.slice(:email)).first.tap do |user|
             user.provider = auth.provider
             user.uid = auth.uid
             user.profile_photo_url = auth.info.image
             user.save
           end

    return user if user

    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.profile_photo_url = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
