class Audio < ActiveRecord::Base
  validates_presence_of :audio_source
  validates_presence_of :word
  validates_presence_of :lang_code
  validates_presence_of :speaker_gender
  # validates_presence_of :forvo_data, :if => audio_source: "forvo" #FIXME
  # validates_presence_of :forvo_id, :if => audio_source: "forvo" #FIXME
  validates_uniqueness_of :forvo_id

  def self.format_forvo_js_for_insert forvo_id
    "<script type=\"text/javascript\" src=\"http://www.forvo.com/_ext/ext-prons.js?id=#{forvo_id.to_s}\" charset=\"utf-8\"></script>".html_safe
  end

  def lang_code_hash
    #TODO
  end


end