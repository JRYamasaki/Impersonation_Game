class Response < ApplicationRecord
  belongs_to :user
  belongs_to :lobby


  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  def timestamp
  	created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
