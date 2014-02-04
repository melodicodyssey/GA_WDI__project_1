#insert omniauth into request flow
#OA will check if request is OA

# OAuth over HTTPS

#ENV = getting from environment
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :feedly, "sandbox", "CM786L1D4P3M9VYUPOB8",
    scope: "https://cloud.feedly.com/subscriptions",
    callback_path: "",
    client_options: {site: "https://sandbox.feedly.com"}
end


#in user model:

# columns:  uid, auth_token, refresh_token