class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def new
    
  end

  def create

    url = params[:link]
    if !valid_uri? url
      flash[:alert] = "Link is fucked up"
      redirect_to new_page_path
      return
    end
    uri = URI.parse(url)
    url = uri.host + uri.path
    @page = current_user.pages.find_by_link( url)
    if @page.nil?
      @page = current_user.pages.create(link: url)
    end
    @tags = params[:tags].split(',').map(&:strip)
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
          @comments << {comment: comment.body , time: comment.updated_at}
        end
      end
      @visited_by << {user: page.user.email ,time: page.updated_at }
    end
    
  end

  def update
  end

  def show
    
  end

  def destroy
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
end
