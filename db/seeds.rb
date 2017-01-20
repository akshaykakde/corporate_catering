# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
   company1 = Company.find_or_create_by!({name:"Josh Software",email:"all@joshsoftware.com",phone_no:9867542190})
   company2 = Company.find_or_create_by!({name: "Veritas",email:"all@veritas.com",phone_no:9867542195})
   company3 = Company.find_or_create_by!({name: "Pubmatic",email:"all@pubmatic.com",phone_no:9867542196})
   company4 = Company.find_or_create_by!({name: "Symantec",email:"all@symantec.com",phone_no:9867542197})
   company5 = Company.find_or_create_by!({name: "Agrostar",email:"all@agrostar.com",phone_no:9867542198})

   company1.create_address({house_no:"GHIB92",locality:"kupwad",city:"Sangli",state:"Maharashtra",pincode:416415}) 						if company1.address.blank?
   company2.create_address({house_no:"WNIB42",locality:"Kharadi",city:"Panji",state:"Goa",pincode:411045}) 										if company2.address.blank?
   company3.create_address({house_no:"WNk086",locality:"Aagarkar Nagar",city:"Indore",state:"Madhya Pradesh",pincode:419045}) if company3.address.blank?
   company4.create_address({house_no:"WYKJK2",locality:"Majage Nagar",city:"Pune",state:"Maharashtra",pincode:411045}) 				if company4.address.blank?
   company5.create_address({house_no:"WNIB42",locality:"Vishrambag",city:"Solapur",state:"Maharashtra",pincode:418945}) 			if company5.address.blank?
   
   vendor1 = Vendor.find_or_create_by({name: "Foodpanda",phone_no: 7798845221})
   vendor2 = Vendor.find_or_create_by({name: "chaitanyaP",phone_no: 7798845222})
   vendor3 = Vendor.find_or_create_by({name: "Venkys",phone_no: 7798845223})
   vendor4 = Vendor.find_or_create_by({name: "Rollsmania",phone_no: 7798845224})
   vendor5 = Vendor.find_or_create_by({name: "Dominoz",phone_no: 7798845225})

   vendor1.addresses.find_or_create_by({house_no:"GHIB93",locality:"kupwad",city:"Sangli",state:"Maharashtra",pincode:416415})
   vendor2.addresses.find_or_create_by({house_no:"WNIB43",locality:"Kharadi",city:"Panji",state:"Goa",pincode:411045})
   vendor3.addresses.find_or_create_by({house_no:"WNk083",locality:"Aagarkar Nagar",city:"Indore",state:"Madhya Pradesh",pincode:419045})
   vendor4.addresses.find_or_create_by({house_no:"WYKJK3",locality:"Majage Nagar",city:"Pune",state:"Maharashtra",pincode:411045})
   vendor5.addresses.find_or_create_by({house_no:"WNIB43"	,locality:"Vishrambag",city:"Solapur",state:"Maharashtra",pincode:418945})





   # company5.addresses.find_or_create_by({house_no:"WNIB42",locality:"Hadapsar",city:"Mumbai",state:"Maharashtra",pincode:411046})