require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
    array = ('a'..'z').to_a
    @letters = array.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split(' ')
    filepath = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}").read
    result = JSON.parse(filepath)


    if result["found"]
      @result = "Well done"
    else @result = "Your word doesn't exist in English"

    end

    @scoree = scored(@word)
    #   return "Your word doesn't exist in English"
    # elsif @word != @letters
    #   return "Your word doesn't match the list of letters"
    # else "Well done the word exist"
    # end
  end

  def scored(word)

    if word.length == 2
      @scores = 200
    elsif word.length == 3
      @scrores = 400
    else @scores = 100000
    end
  end

end
