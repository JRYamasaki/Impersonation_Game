require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "testtest" do
  	score = Score.new
  	assert_not score.save
  end
end
