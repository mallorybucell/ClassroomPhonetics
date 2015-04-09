class Audio < ActiveRecord::Base
  #validate / limit source

  def self.format_forvo_js_for_insert forvo_id
    "<script type=\"text/javascript\" src=\"http://www.forvo.com/_ext/ext-prons.js?id=#{forvo_id.to_s}\" charset=\"utf-8\"></script>".html_safe
  end
end