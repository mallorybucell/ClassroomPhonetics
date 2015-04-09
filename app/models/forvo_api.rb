class ForvoApi

  include HTTParty
    # base_uri "apifree.forvo.com/key/#{ENV['FORVO_API_KEY']}"

  def self.get_word_pronunciations(word, limit)
    HTTParty.get("http://apifree.forvo.com/key/#{ENV['FORVO_API_KEY']}/format/json/action/word-pronunciations/word/#{word}/language/en/limit/#{limit}")
  end


end