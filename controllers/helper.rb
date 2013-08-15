helpers do
  def mongo_client
    settings.mongo_client
  end
  def mongo_db
    settings.mongo_db
  end
  def mongo_coll
    settings.mongo_coll
  end
end

# helpers do

#   MODELS = ['tool', 'language', 'computer', 'computer_tool', 'operation'].freeze
#   def render_models_nav
#     nav_links = []
#     MODELS.each do |model|
#       nav_links << content_tag('li', link_to(model.capitalize, '/' + model.pluralize) ) 
#     end
#     nav_links.join("\n").html_safe
#   end


#   ALERT_TYPES = [:error, :info, :success, :warning].freeze
#   def bootstrap_flash
#     flash_messages = []
#     flash.each do |type, message|
#       next if message.blank?
#       type = :success if type == :notice
#       type = :error   if type == :alert
#       next unless ALERT_TYPES.include?(type)
#       Array(message).each do |msg|
#         text = content_tag(:div,
#                            content_tag(:button, "&times;", :class => "close", "data-dismiss" => "alert") +
#                            msg.html_safe, :class => "alert fade in alert-#{type}")
#         flash_messages << text if msg
#       end
#     end
#     flash_messages.join("\n").html_safe
#   end

#   def logger
#     request.logger
#   end
# end

