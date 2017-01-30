class Image
  include Mongoid::Document
  belongs_to :imageable, polymorphic: true #polymorphic association
  field :picture, type: Array, default: []
end
