OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '723646061101119', 'ec2bd3a293728ead5040c7a954d9f69e',
  		:scope => 'email,user_birthday,read_stream', :display => 'popup'
end