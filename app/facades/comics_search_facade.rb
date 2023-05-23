class ComicsSearchFacade
  attr_reader :user_id, :query_params 

  def initialize(user_id, query_params)
    @user_id = user_id
    @query_params = query_params
  end

 

  def service
    ComicService.new
  end

  def comics_keyword
    service.comics_keyword(@query_params)[:results].map do |data|
      Comic.new(data)
    end
  end

  def user
    User.find(@user_id)
  end
end