# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :inline

configure :build do
  activate :minify_css, inline: true
  activate :minify_javascript
  activate :asset_hash, ignore: %r{^assets/static/.*}
  # activate :gzip
  activate :minify_html
end

activate :deploy do |deploy|
  deploy.deploy_method   = :ftp
  deploy.host = 'tfc-leipzig.com'
  deploy.path = '/web'
  deploy.user = ENV.fetch('TFC_FTP_USER')
  deploy.password = ENV.fetch('TFC_FTP_PASSWORD')
end