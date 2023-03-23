class User < ApplicationRecord
  has_many :comics
  has_many :action_figures
  has_many :manga

  validates_presence_of :username
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, presence: true, confirmation: true, on: :create
  validates_presence_of :password_confirmation, presence: true

  has_secure_password
end
