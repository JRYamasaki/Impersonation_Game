class ScoreController < ApplicationController


  def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { notice: 'Scores unable to create!' }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end


end
