# class to store orders
class Order
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :date, type: Date
  field :time, type: Time

  validates :date, :time, presence: true
  has_and_belongs_to_many :menu_items

  has_and_belongs_to_many :users  
  
end
