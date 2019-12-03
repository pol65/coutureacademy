# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "js")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "js", "core")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "js", "plugins")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss", "material-kit")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss", "material-kit", "boostrap")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss", "material-kit", "boostrap", "scss")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss", "material-kit", "boostrap", "scss", "mixins")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss", "material-kit", "boostrap", "scss", "utilities")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss", "material-kit", "cards")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss", "material-kit", "mixins")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss", "material-kit", "plugins")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss", "material-kit", "sections")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "scss", "material-kit", "variables")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "css")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( application.scss.css )
