class ComicsFacade
  attr_reader :user_id, :query_params 

  def initialize(user_id, query_params)
    @user_id = user_id
    @query_params = query_params
  end

 

  def service
    ComicService.new
  end

def comics_keyword
  response = service.search_comics(@query_params)
  
  if response[:status_code] == 101
    [] # Handle the "Object Not Found" error as needed
  else
    response[:results].map do |data|
      Comic.new(data)
    end
  end
end

  def user
    User.find(@user_id)
  end
end