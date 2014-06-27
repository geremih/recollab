class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @tags = Kaminari.paginate_array(@user.tags.uniq.sort_by(&:name)).page(params[:page]).per(10)
  end

end
