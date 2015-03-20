OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
    provider :facebook, '723646061101119', 'ec2bd3a293728ead5040c7a954d9f69e',
      		:scope => 'email,user_birthday,read_stream', :display => 'popup'

  else
    provider :facebook, '832584233475739', '0ccc79e1773425635c9a0b0db748f973',
      		:scope => 'email,user_birthday,read_stream', :display => 'popup'
  end
end