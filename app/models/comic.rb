class Comic < ApplicationRecord
  belongs_to :user
  attribute :site_detail_url, :string
  attribute :resource_type, :string
  attribute :store_date, :date
  attribute :image, :string
  attribute :volume, :string
  validates_presence_of :name
  validates_presence_of :issue
  validates_presence_of :publisher
  serialize :image, JSON

  def image_url
    self.image["medium_url"] if self.image.present?
  end


  def self.search(query)
    if query.present?
      where('title LIKE ?', "%#{query}%")
    else
      all
    end
  end
end
