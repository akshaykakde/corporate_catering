# class to store all menu items
class MenuItem
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, type: String
  field :veg, type: Boolean
  field :price, type: String
  field :image, type: String

  validates :name, :price, presence: true
  validates :veg, inclusion: { in: [true, false] }
  has_and_belongs_to_many :orders
  belongs_to :vendor

  
  scope :veg, -> { where(veg: true) }
  scope :non_veg, -> { where(veg: false) }
end