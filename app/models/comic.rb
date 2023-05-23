class Comic < ApplicationRecord
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :issue
  validates_presence_of :publisher

  def self.search(query)
    if query.present?
      where("title LIKE ?", "%#{query}%")
    else
      all
    end
  end
end
