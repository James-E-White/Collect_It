class Manga < ApplicationRecord
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :issue
  validates_presence_of :publisher
end