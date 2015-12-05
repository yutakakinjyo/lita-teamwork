require "lita"


Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/teamwork"
require "lita/domain/account"
require "lita/domain/account_repo"
require "lita/domain/hub_client"
require "lita/domain/github_repo"

Lita::Handlers::Teamwork.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
