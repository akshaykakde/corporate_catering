class Order
  include Mongoid::Document 
  include Mongoid::Attributes::Dynamic

  field :date, type:Date
  field :price, type:Integer

  validates :date,:price,presence:true
  has_and_belongs_to_many :menu_items
end
