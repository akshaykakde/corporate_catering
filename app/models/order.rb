# class to store orders
class Order
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :date, type: Date
  field :time, type: Time

  validates :date, :time, presence: true
  has_and_belongs_to_many :menu_items
<<<<<<< HEAD
  has_and_belongs_to_many :users  
=======
  has_and_belongs_to_many :users
>>>>>>> 718bd52e030f13a447d3d5dc789505045f27853f
end
