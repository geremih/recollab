class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  def render404
    render :file => File.join(Rails.root, 'public', '404.html'), :status => 404, :layout => false
    return true
  end

end
