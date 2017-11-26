class Lobby < ApplicationRecord
  belongs_to :user
  has_many :responses, dependent: :destroy
  has_many :users, through: :responses
end
