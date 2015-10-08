class User < ActiveRecord::Base
	has_many :trips
  has_many :identities
  # validates_presence_of :uid, :provider, :email
  validates_uniqueness_of :uid, :scope => :provider
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  def self.from_omniauth(auth)  

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    if auth.provider == "twitter"
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.nickname
      user.password = Devise.friendly_token[0,20]
    elsif auth.provider == "facebook"  
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      # user.email = auth.info.name
      user.password = Devise.friendly_token[0,20]
    else
    	user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
    end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  		new(session["devise.user_attributes"], without_protection: true) do |user|
  			user_attributes = params
  			user.valid?
  		end
  	else
  		super
  end
end

end