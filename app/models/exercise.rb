class Exercise < ActiveRecord::Base
  has_many :lesson_exercises
  has_many :lessons, through: :lesson_exercises

  def create_exercise(exercise_code)
  end

  def self.stem_text_hash
    { "L-WI" => "Listen to the recording. Then write IPA to record what you hear in the space provided.", 
      "RI-W" => "Write the English word that this IPA notation records.", 
      "R-WI" => "Write this word in IPA notation.", 
      "RI-S" => "Record yourself speaking aloud the word or sounds recorded in this IPA notation."
    }
  end

  def stem_text_hash_lookup
    Exercise.stem_text_hash[self.exercise_code]
  end

  def create_description(answer)
    description = "#{answer}-#{self.exercise_code}"
    description
  end

#TODO: duplication and hash for views. combine this.
  def self.content_types_and_explanation
    content_types_and_explanations = [ 
      ["Listen, then write what is heard in IPA", "L-WI" ], 
      ["Read a word in IPA, then write it in English", "RI-W" ], 
      ["Read an English word, then write it in IPA", "R-WI" ], 
      ["Read IPA, then speak it aloud", "RI-S" ] 
    ]
  end

  def self.task_hash
    { "L-WI" => "listen, then write what is heard in IPA", 
      "RI-W" => "Read a word in IPA, then write it in English", 
      "R-WI" => "Read an English word, then write it in IPA", 
      "RI-S" => "Read IPA, then speak it aloud" 
    }
  end

  def current_status
    lessons = self.lessons.includes(:assignments).where('assignments.due_at' => (Time.now..1.year.from_now)).references(:assignments)
    if lessons != []
      "assigned"
    else
      "unassigned"
    end
  end


end
