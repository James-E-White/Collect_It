class ComicsController < ApplicationController
    def discover
        @facade = ComicsSearchFacade.new(params[:id], params[:query])
        @comics = @facade.comics_keyword
    end

  def search
    @facade = ComicsSearchFacade.new(params[:id], params[:query])
    if @facade.query_params.blank?
      flash[:alert] = "Error: You must provide a query"
      redirect_to discover_comics_path(@facade.user_id)
    else
      @comics = @facade.comics_keyword
    end
  end

  def show 
    @facade = ComicDetailsFacade.new(params[:user_id], params[:id])
  end

end