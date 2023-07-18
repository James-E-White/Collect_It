class ComicsFacade
  attr_reader :user_id, :query_params, :service

  def initialize(user_id, query_params, service = ComicService.new)
    @user_id = user_id
    @query_params = query_params
    @service = service
  end

  def comics_keyword
    response = service.search_comics(@query_params)

    if response[:status_code] == 101
      raise CustomError, "Comic not found" 
    else
      comics = response[:results].map do |data|
        existing_comic = Comic.find_by(comic_vine_id: data[:comic_vine_id])

        if existing_comic.nil?
          Comic.create(data)
        else
          existing_comic.update(data)
          existing_comic
        end
      end

      comics
    end
  end

  def user
    User.find(@user_id)
  end
end