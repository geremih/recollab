class TagsController < ApplicationController
  def show
    @pages = Tag.find(params[:id]).pages
    @pages =Kaminari.paginate_array(@pages.sort_by(&:updated_at).reverse).page(params[:page]).per(10)
  end
end
