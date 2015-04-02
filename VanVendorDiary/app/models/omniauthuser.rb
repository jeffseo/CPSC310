class Omniauthuser < ActiveRecord::Base
  # def self.create_with_omniauth(auth)  
  #   create! do |omniauthuser|  
  #     omniauthuser.provider = auth["provider"]  
  #     omniauthuser.uid = auth["uid"]  
  #     omniauthuser.name = auth["user_info"]["name"]  
  #   end  
  # end  

	def self.from_omniauth(auth)  
    	  find_by_provider_and_uid(auth["provider"], auth["uid"])# || create_with_omniauth(auth)  
  	end  

	def self.omniauth(auth)
   	  where(provider: auth.provider, uid: auth.uid).first_or_create do |omniauthuser|
      	  omniauthuser.provider = auth.provider
      	  omniauthuser.uid = auth.uid
	  omniauthuser.name = auth.info.name
	  omniauthuser.image = auth.info.image
      	  omniauthuser.token = auth.credentials.token
      	  omniauthuser.save!
     end
  end
end
