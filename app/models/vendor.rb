# class for storing vendor objects
class Vendor
  include Mongoid::Document
  field :name, type: String
  field :phone_no, type: Integer
  field :logo, type: String

  validates :name, presence: true
  validates :phone_no, length: { is: 10 }
  validates :phone_no, numericality: { only_integer: true }



  has_many :menu_items

  has_many :addresses, as: :location
  has_and_belongs_to_many :companies
end
