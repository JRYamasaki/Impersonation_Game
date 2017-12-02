class User < ApplicationRecord
  has_one :score
  has_many :lobbies, dependent: :destroy
  has_one :lobby, through: :responses
  has_many :responses, dependent: :destroy

  validates :username, uniqueness: true, presence: true
  validates :email, presence:true
  validates :password, presence: true


## GIVES ME BUGS, CONFIRM WITH RICKY THAT THIS WORKS.

  after_create :create_scores

  def create_scores
    self.create_score(wins: '0', correctGuess: '0', incorrectGuess: '0')
  end

end
