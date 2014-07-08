class User < ActiveRecord::Base 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable

  has_and_belongs_to_many :roles
  has_many :pages, dependent: :destroy
  has_many :tags, through: :pages, dependent: :destroy
  has_many :follower_tag_relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_tags, through: :follower_tag_relationships, source: :tag , dependent: :destroy
  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def make_admin
    self.roles << Role.admin
  end

  def revoke_admin
    self.roles.delete(Role.admin)
  end

  def admin?
    role?(:admin)
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20], :name => data[:name])
    end
  end

end
