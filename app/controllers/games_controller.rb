require 'json'
require 'open-uri'
class GamesController < ApplicationController
  VOWELS = %w(A E I O U Y)
  def new
    @letters = Array.new(5) { VOWELS.sample }
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end

  # def english_word
  #   url = "https://wagon-dictionary.herokuapp.com/#{@word}"
  #   word_dictionary = open(url).read
  #   answer = JSON.parse(word_dictionary)
  #   return answer['found']
  # end
  
  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_dictionary = open(url).read
    @answer = JSON.parse(word_dictionary)
    raise
    if @answer['found'] == true
      @result = "Congratulations ${@word} is an english word"
    else 
      @result = "It's not an english word"
    end
  end  
end
