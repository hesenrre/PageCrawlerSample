class PagesController < ApplicationController
  protect_from_forgery with: :null_session
  
  def index
    @pages = Page.all
  end
  
  def create
    begin
      page = Page.new(PageCrawler.new.process_page(url_param[:url]))
      if page.save
        head :created
      else
        render json: page.errors, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: {error: e.message}, status: :unprocessable_entity
    end
  end
  
  def url_param
    params.require(:page).permit(:url)
  end
  
end
