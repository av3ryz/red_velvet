class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def db
    ActiveRecord::Base.connection
  end

  def sanitize_sql(query)
    ActiveRecord::Base.send(:sanitize_sql_array, query)
  end
end
