class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable

  devise :invitable, :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_validation :insert_company_id
  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Invitable
  field :invitation_token, type: String
  field :invitation_created_at, type: Time
  field :invitation_sent_at, type: Time
  field :invitation_accepted_at, type: Time
  field :invitation_limit, type: Integer

  index( {invitation_token: 1}, {:background => true} )
  index( {invitation_by_id: 1}, {:background => true} )
  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  ##fields
  field :name, type: String
  field :role, type: String
  field :phone_no, type: Integer
  field :active, type: Boolean

  validates :name, :active,  :role, :phone_no, presence: true
  validates :name, case_sensitive: false
  validates :phone_no, :email, uniqueness: { case_sensitive: false, scopes: :company_id }
  has_and_belongs_to_many :orders
  belongs_to :company 

  has_one :address, as: :location

  def insert_company_id
    self.company_id = User.find_by(:_id => self.invited_by_id).company_id
  end
end
