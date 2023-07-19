class ComicsFacade
  attr_reader :user_id, :query_params, :service

  def initialize(user_id, query_params, service = ComicService.new)
    @user_id = user_id
    @query_params = query_params
    @service = service
  end

  def comics
    response = service.search_comics(@query_params)

    raise CustomError, 'Comic not found' if response[:status_code] == 101

    response[:results].map do |data|
      create_or_update_comic(data)
    end
  end

  def user
    User.find(@user_id)
  end

  private

  def create_or_update_comic(data)
    comic = Comic.find_or_initialize_by(comic_vine_id: data[:comic_vine_id])
    comic.assign_attributes(
      title: data[:title],
      issue: data[:issue],
      publisher: data[:publisher],
      image_url: data[:image_url]
    )
    comic.save
    comic
  end
end
