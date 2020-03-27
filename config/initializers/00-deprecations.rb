$deprecation_logger = Logger.new("#{Rails.root}/log/deprecations.log")

ActiveSupport::Notifications.subscribe('deprecation.rails') do |name, start, finish, id, payload|
  $deprecation_logger.info payload[:message]
end

ActiveSupport::Deprecation.behavior = [:stderr, :notify]