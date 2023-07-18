class Comic 
  attr_reader :title, :issue, :publisher, :comic_vine_id

  def initialize(data)
    @title = data[:title]
    @issue = data[:issue]
    @publisher = data[:publisher]
    @comic_vine_id = data[:comic_vine_id]
  end
end