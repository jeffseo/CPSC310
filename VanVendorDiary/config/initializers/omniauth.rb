OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '832584233475739', '0ccc79e1773425635c9a0b0db748f973'
end