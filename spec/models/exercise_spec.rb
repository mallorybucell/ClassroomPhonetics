require 'rails_helper'

RSpec.describe Exercise, type: :model do

it 'can belong to each lesson only once' do #TODO per course? 

  l = FactoryGirl.create  :lesson
  e = FactoryGirl.create :exercise
  LessonExercise.create!(lesson_id: l.id, exercise_id: e.id)
  
  expect do
    (LessonExercise.create!(lesson_id: l.id, exercise_id: e.id))
  end.to raise_error
end

it 'knows its correct response(s)'

it 'knows what content it requires'

it 'knows what audio it needs'

it 'knows it boilerplate instructions'

it 'can save IPA input'

it 'can render IPA input'

it 'can be added to a lesson'

it 'can displaly feedback to students'

it 'cannot be added to the same lesson twice'

it 'knows its codes'
  #TrscIPA written word into IPA (opt audio recording)
  #TrscAudio  transcribe audio into IPA
  #IPAnat    from ipa into nat lang word
  #TrnsComment  Comment on IPA transcription (actual comments, upvotes, downvotes one per student per pronunciation)
      #-is this a subtype of the above??
end
