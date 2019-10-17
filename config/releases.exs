import Config

secret_key_base = System.fetch_env!("SECRET_KEY_BASE")
cool_text = System.fetch_env!("COOL_TEXT")
application_port = System.fetch_env!("APP_PORT")
db_url = System.get_env("DATABASE_URL")
db_pool_size = String.to_integer(System.get_env("POOL_SIZE") || "10")
public_hostname = System.fetch_env!("PUBLIC_HOSTNAME")

config :macaroni, MacaroniWeb.Endpoint,
  http: [:inet6, port: String.to_integer(application_port)],
  server: true,
  secret_key_base: secret_key_base

config :macaroni,
  cool_text: cool_text,
  public_hostname: public_hostname

config :macaroni, Macaroni.Repo,
  url: db_url,
  pool_size: db_pool_size,
  ssl: false
