class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :username, :first_name, :last_name
  # has_secure_password

  before_save { email.downcase! }
  before_save :create_remember_token

  # validates :username,  presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :reverse_guestlists, foreign_key: "viewer_id", class_name: "Guestlist", dependent: :destroy
  has_many :events_hosted, foreign_key: "host_id", class_name: "Event"
  has_many :events_attending, through: :reverse_guestlists, source: :event
  has_many :charges

  def full_name
    return self.first_name + ' ' + self.last_name
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
