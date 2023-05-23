  class ComicService 
  def comic_details(id)
    get_url("https://comicvine.gamespot.com/?api_key=#{ENV['tmdb_key']}&language=en-US")
  end
  
  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end