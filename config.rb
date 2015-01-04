###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

###
# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
###
data.categories.each do |c|
	c[:products].each do |p|
		proxy "/#{c[:freindlyName]}/#{p[:freindlyName]}.html", "product_detail.html", :locals => { :category => c, :product => p }, :ignore => true
	end
end

data.categories.each do |c|
	proxy "/#{c[:freindlyName]}.html", "products.html", :locals => { :category => c, :products => c[:products] }, :ignore => true
end

###
# Page command
###
#

active_nav = {:class => "active"}


###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Active page helper 
helpers do
  def nav_active(page)
    @page_id == page ? {:class => "active"} : {}
  end
end

set :css_dir, 'themes/css'

set :js_dir, 'themes/js'

set :images_dir, 'themes/images'

#remove layout for sitemap
page "/sitemap.xml", :layout => false

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

# Minify Javascript on build
activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end


