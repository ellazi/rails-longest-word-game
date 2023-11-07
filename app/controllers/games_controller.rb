require "open-uri"

class GamesController < ApplicationController
  VOWELS = %w(A E I O U Y)

  def new
    @letters = Array.new(5) { VOWELS.sample }
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end

  def score
    @score = 0
    @word = params[:word].upcase
    @letters = params[:letters]
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(response.read)
    if params[:word].include?(@letters)
      @result = "Sorry but #{@word} can't be built out of #{@letters}"
    elsif json["found"] == false
      @result = "Sorry but #{@word} does not seem to be a valid English word..."
    else
      @result = "Congratulations! #{@word} is a valid English word!"
      @score += @word.length
    end
  end
end
