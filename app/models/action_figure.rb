class ActionFigure < ApplicationRecord
  belongs_to :user

  validates_presence_of :figure
  validates_presence_of :brand
end
