Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'znjzuaU3IKBzW3AZuj8mOM4odcsxqdNk',
    '-hw5VV9OGVRELYjuE5RaU3q7egaGSofcbZQblzeJG2abCY4srpdxE_8VcADEj1DX',
    'izzy-code.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end
