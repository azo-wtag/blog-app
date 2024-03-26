backend_uri = URI.parse('http://localhost:3000')

Rails.application.default_url_options = {
  host: backend_uri.host,
  port: backend_uri.port,
  protocol: backend_uri.scheme,
}
