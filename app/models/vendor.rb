class Vendor
	include Mongoid::Document
  field :name, type: String
  field :phone_no, type: Integer

	validates :name,presence:true
	validates :phone_no,length:{is:10}
	validates :phone_no,numericality:{only_integer:true}


	has_many :addresses, as: :location



end
