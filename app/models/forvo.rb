class Forvo

  include HTTParty
    # base_uri "apifree.forvo.com/key/#{ENV['FORVO_API_KEY']}"

  def self.get_word_pronunciations(word, limit)
    HTTParty.get("http://apifree.forvo.com/key/#{ENV['FORVO_API_KEY']}/format/json/action/word-pronunciations/word/#{word}/language/en/limit/#{limit}")
  end

  def self.store_audio_id
  end

  def format_js_for_insert forvo_id
    "<script type=\"text/javascript\" src=\"http://www.forvo.com/_ext/ext-prons.js?id=#{forvo_id.to_s}\" charset=\"utf-8\"></script>"
  end



end