class Omniauthuser < ActiveRecord::Base
	def self.omniauth(auth)
    where(auth.slice(:provider, :uid).permit!).first_or_initialize.tap do |omniauthuser|
      omniauthuser.provider = auth.provider
      omniauthuser.uid = auth.uid
      omniauthuser.name = auth.info.name
      omniauthuser.image = auth.info.image
      omniauthuser.token = auth.credentials.token
      omniauthuser.expires_at = Time.at(auth.credentials.expires_at)
      omniauthuser.save!
    end
  end
end
