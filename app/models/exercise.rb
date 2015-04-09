class Exercise < ActiveRecord::Base
  has_many :lesson_exercises
  has_many :lessons, through: :lesson_exercises

  def create_exercise(exercise_code)
  end

  def stem_text_hash
    { "L-WI" => "Listen to the recording. Then write IPA to record what you hear in the space provided.", "RI-W" => "Which English word does this IPA notation record?", "R-WI" => "Write this word in IPA notation.", "RI-S" => "Record yourself speaking aloud the word or sounds recorded in this IPA notation."}
  end

  def self.content_types_and_explanation
    content_types_and_explanations = [ ["listen_then_write_IPA", "L-WI" ], ["read_IPA_write_natively", "RI-W" ], [ "read_natively_write_IPA", "R-WI" ], ["read_then_speak_IPA_aloud", "RI-S" ] ]
  end


end
