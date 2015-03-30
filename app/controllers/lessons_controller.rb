class LessonsController < ApplicationController

  def return_words
    response = Forvo.get_word_pronunciations('cat', '3')
    #check_or_add_to forvo table
    head :ok
  end
end
