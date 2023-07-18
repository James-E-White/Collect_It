class ComicService
  include HTTParty

  base_uri 'https://comicvine.gamespot.com/api'

  def comic_details(id)
    api_key = ENV['comic_vine_api']
    url = "/issue/#{id}?api_key=#{api_key}&format=json"
    get_url(url)
  end

def search_comics(query)
  api_key = ENV['comic_vine_api']
  url = "/search/?api_key=#{api_key}&format=json&resources=issue"
  url += "&query=#{URI.encode(query)}" if query.present?
  
  response = get_url(url)
  puts response.inspect 
  
  response
end

  private

  def get_url(url)
    response = self.class.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
