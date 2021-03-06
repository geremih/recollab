class PagesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery :except => :create 
    after_action :allow_iframe, only: :result

  def index
    if params[:tag]
      @pages = current_user.followed_tags.select{ |t| t.name == params[:tag]}.map(&:pages).flatten.uniq + current_user.tags.select{ |t| t.name == params[:tag]}.map(&:pages).flatten.uniq
    else
    @pages = current_user.followed_tags.map(&:pages).flatten.uniq +  current_user.pages.flatten.uniq
    end
    @pages =Kaminari.paginate_array(@pages.sort_by(&:updated_at).reverse).page(params[:page]).per(10)
  end

  def new
    
  end

  def create
    url = params[:link]
    url = final_url(url)
    @page = current_user.pages.find_by_link( url)
    if @page.nil?
      @page = current_user.pages.create(link: url, title: params[:title])
    end

    if params[:tags]
      @tags = params[:tags].split(',').map(&:strip)
    else
      @tags = []
    end
    
    comment = params[:comment]
    if !comment.nil?
      @page.comments.create(body: comment)
    end
    user_tags = current_user.tags
    user_tags_names = user_tags.map(&:name).uniq
    @tags.each do |tag|
      if   !@page.tags.map(&:name).include?(tag)
        if user_tags_names.include? tag
          existing_tag = user_tags.find_by_name(tag)
          @page.tags << existing_tag
        elsif
          @page.tags.create(name: tag)
        end
      end
    end
  end

  def edit
  end


  def result
    query = params[:link]
    query = final_url(query)

    pages = current_user.followed_tags.map(&:pages)
    pages << current_user.pages
    pages.flatten!
    @result = pages.select{ |p| p.link == query }
    
    @comments = @result.map(&:comments).flatten
    @comments = []
    @visited_by = []
    @result.each do |page|
      if !page.comments.empty?
        page.comments.each do | comment|
          @comments << comment
        end
      end
      @visited_by << {user: page.user ,time: page.updated_at }
    end
    @comments = @comments.sort_by(&:updated_at).reverse
    respond_to  do |format|
      format.html 
      format.js 
    end
    
  end

  def update
  end

  def show
    
  end

  def destroy
    id = params[:id].to_i
    page = Page.find(id)
    if !page.nil? && page.user == current_user
      page.destroy
    end
    redirect_to :back
  end


  private
  def valid_uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def final_url(url)
    if !valid_uri? url
      flash[:alert] = "Link is fucked up"
      redirect_to new_page_path
      return
    end
    uri = URI.parse(url)
    if !uri.query.nil?
      query = "?#{uri.query}"
    end
    if !uri.fragment.nil?
      fragment = "##{uri.fragment}"
    end
    "#{uri.host}#{uri.path}#{query}#{fragment}"
  end
end
