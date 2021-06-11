class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_entry_not_found

  private

  def rescue_with_entry_not_found
    render html: '<h1>Entry not found</h1>'.html_safe
  end
end
