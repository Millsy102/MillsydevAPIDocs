# Simple Jekyll plugin to inject GitHub environment variables
module Jekyll
  class EnvInjectorGenerator < Generator
    safe true
    priority :low

    def generate(site)
      # Get environment variables from GitHub
      admin_username = ENV['ADMIN_USERNAME'] || 'admin'
      admin_password = ENV['ADMIN_PASSWORD'] || 'admin123'
      
      # Add to site data
      site.data['admin_username'] = admin_username
      site.data['admin_password'] = admin_password
    end
  end
end
