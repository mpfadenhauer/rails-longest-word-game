require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a[rand(26)] }
    # p @letters
  end

  def wordcheck
    @userinput = params[:word].upcase.split
    @userinput.each do |letter|
      userinput2 = @userinput.count(letter)
      raise
      generatorinput = params[:grid].join("")
      if generatorinput >= userinput2
        true
      end
    end
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    user_serializated = open(url).read
    answer = JSON.parse(user_serializated)
    # p answer
    if wordcheck == true
      if answer['found'] == true
        @answer = 'The word is valid according to the grid and is an
        English word'
      elsif answer['found'] == false
        @answer = 'The word is valid according to the grid, but is not a valid
        English word'
      end
    else @answer = "The word can't be built out of the original grid"
    end
  end
end
