class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :set_time_zone
  before_action :set_dynamic_hosts
  before_action :set_paper_trail_whodunnit
  # before_action :set_pagination
  # before_action :authenticate_user!

  # skip_around_action :set_locale_from_url


  private


  REQUIRE_AUTH_FOR = [
    'admin'
  ].freeze

  def not_found
    fail ActionController::RoutingError.new('Not Found')
  end

  def set_dynamic_hosts
    ActionController::Base.asset_host = proc { |_source, request|
      "#{request.protocol}#{request.host_with_port}"
    }

    ActionMailer::Base.default_url_options = {:host => request.host_with_port}
  end

  def set_locale
    # enable this when we want multiple locales, it will automatically
    # change routes ui etc
    # I18n.locale = params[:locale] || I18n.default_locale
    # I18n.locale = I18n.default_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_time_zone
    Time.zone = 'Europe/Istanbul'
  end

  # def set_pagination
  #   WillPaginate.per_page = 30
  # end
end

