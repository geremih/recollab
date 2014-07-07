class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  def home
    if signed_in?
      redirect_to user_root_path 
    end
  end
end
