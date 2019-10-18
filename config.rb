# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

class Event
	attr_reader :date, :title, :description, :image
	def initialize(raw_event = {})
		@date = DateTime.parse(raw_event.date)
		@title = raw_event.title
		@description = raw_event.description
		@image = raw_event.image
	end

	def formatted_date
		@date.strftime('%B %d, %Y')
	end

	def formatted_time
		@date.strftime('%I:%M%P')
	end

	def formatted_datetime
		@date.strftime('%B %d, %Y %I:%M%P')
	end
end

helpers do
  def events
		data.events.map { |event| Event.new(event) }
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
