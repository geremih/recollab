class TagsController < ApplicationController
  def show
    @pages = Tag.find(params[:id]).pages
    @pages =Kaminari.paginate_array(@pages.sort_by(&:updated_at).reverse).page(params[:page]).per(10)
  end

  def destroy
    tag = Tag.find(params[:id])
    if !tag.nil?
      Tag.find(params[:id]).destroy
    end
    redirect_to user_path(current_user)
  end
end
