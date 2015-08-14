# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  profession             :string
#  role                   :string
#  phone                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  university_id          :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  provider               :string
#  uid                    :string
#  authentication_token   :string
#


class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]


  # Validation
  #validates :name , presence: true
  #validates :email, uniqueness: true, presence: true
 
  # References
  has_many :pins
  has_many :applications
  belongs_to :university

  before_save :default_values, :ensure_authentication_token


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def verificarFbAccessToken(fbSecretToken)
    @graph = Koala::Facebook::API.new(fbSecretToken)
    
    begin
      @graph.get_connections(self.uid, 'permissions')
    rescue
      # Token invalido
     return false
    end
    
    return true
  end

   def default_values
    self.role ||= 'usuario'
    nil
  end


  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def reset_authentication_token
    self.authentication_token = ''
    ensure_authentication_token
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Usuario.where(authentication_token: token).first
    end
  end

end
