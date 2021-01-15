# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#Get rid of the "fields_with_error" tag that Rails adds to an error.
#Use Bootstrap instead
ActionView::Base.field_error_proc = Proc.new do|html_tag, instance|
  html_tag.html_safe
end
