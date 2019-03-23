require 'html-proofer'

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

after_build do |builder|
  begin
    HTMLProofer.check_directory(config[:build_dir], assume_extension: true).run
  rescue RuntimeError => e
    puts e
  end
end
