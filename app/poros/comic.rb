class Comic 
  attr_reader :title, :issue, :publisher

  def initialize(data)
    @title = data[:title]
    @issue = data[:issue]
    @publisher = data[:publisher]
  end
end