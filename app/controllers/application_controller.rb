class ApplicationController < ActionController::API
  include JsonapiErrorsHandler
  rescue_from ::StandardError, with: lambda { |e| handle_error(e) }

  DEFAULT_PAGE = 1
  DEFAULT_PER_PAGE = 20

  render formats: :json

  private

  def default_per_page
    params[:per_page] || DEFAULT_PER_PAGE
  end

  def default_page
    params[:page] || DEFAULT_PAGE
  end
end
