Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'gjggPWwo53rnudhtxhvBaszmeNJKUZDi',
    'Viue6cFIVDPc-qX_GYHfyInqKPdzuKxuEaqooo4pARGXIA17lLFgi_mfTU6xnrZm',
    'izzy-code.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end
