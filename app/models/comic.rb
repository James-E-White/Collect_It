class Comic < ApplicationRecord
  belongs_to :user
  has_many :user_comics
  has_many :users, through: :user_comics

  attribute :comic_vine_id, :string
  attribute :site_detail_url, :string
  attribute :resource_type, :string
  attribute :store_date, :date
  attribute :image_url, :string
  attribute :volume, :string
  attribute :issue, :string
  attribute :title, :string

  validates_presence_of :title
  validates_presence_of :issue
  validates_presence_of :publisher

  #serialize :image, JSON

  def image_url
    image['medium_url'] if image.present?
  end

  def self.search(query)
    if query.present?
      where('title LIKE ?', "%#{query}%")
    else
      all
    end
  end
end
