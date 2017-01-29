
# company class for storing records of companies
class Company
  require 'emailvalidator'
  include Mongoid::Document
  field :name, type: String
  field :phone_no, type: Integer
  field :email, type: String
    
  validates :name, presence: true
  validates :phone_no, length: { is: 10 }
  validates :phone_no, numericality: { only_integer: true }
  validates :email, presence: true, email: true
<<<<<<< HEAD
  validates :name,:email,:phone_no, uniqueness: true
  has_many :users
=======

  has_and_belongs_to_many :vendors
>>>>>>> 718bd52e030f13a447d3d5dc789505045f27853f
  has_one :address, as: :location
  has_many :users
end
