class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
    # raise
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    word_valid = check_word_validity(@word)
    word_in_letters = check_word_in_letters(@word, @letters)

    if !word_in_letters
      @result_message = "Sorry but #{@word} can't be built out of #{@letters}"
    elsif !word_valid
      @result_message = "Sorry but #{@word} does not seem to be a valid English word..."
    else
      @result_message = "Congratulations! #{@word} is a valid English word!"
    end
    # raise
  end

  def check_word_validity(word)
    URI.parse("https://wagon-dictionary.herokuapp.com/#{word}")
  end

  def check_word_in_letters(word, letters)
    word.chars.all? { |char| word.count(char) <= letters.count(char) }
  end
end
