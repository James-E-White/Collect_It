class ComicsController < ApplicationController
    def discover
        @comics = Comic.search(params[:query])
    end

  def index
    @facade = ComicsSearchFacade.new(params[:id], params[:q])
    if @facade.query_params == ""
      flash[:alert] = "Error: You must provide a query"
      redirect_to "/users/#{@facade.user_id}/discover"
    end
  end

  def show 
    @facade = ComicDetailsFacade.new(params[:user_id], params[:id])
  end

end