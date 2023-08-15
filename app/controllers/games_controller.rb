require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = %w(Y Z D U Q E Z Y I)
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    url = `{"message":"welcome","endpoints":["https://wagon-dictionary.herokuapp.com/:word","https://wagon-dictionary.herokuapp.com/autocomplete/:stem"],"total_api_hits":6336350,"words_found":3152938,"autocomplete_hits":1899435}`
    flats = JSON.parse(URI.open(url).read)
  end
end
