OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '146783438812838', '5d0c8d2d7c91d4a015446b56a37ed8fc'
end
