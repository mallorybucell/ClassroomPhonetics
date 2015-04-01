require 'rails_helper'

RSpec.describe Exercise, type: :model do

it 'belongs to only one student'

it 'is assigned by a teacher'

it 'is associated with a course'#may be unnecessary

it 'has a rubric'

it 'knows what content it requires'

it 'lets a teacher pick the content'

it 'knows what audio it needs'

it 'knows it boilerplate instructions'

it 'can save IPA input'

it 'can render IPA input'

it 'knows its type'
  #TrscIPA written word into IPA (opt audio recording)
  #TrscAudio  transcribe audio into IPA
  #IPAnat    from ipa into nat lang word
  #TrnsComment  Comment on IPA transcription (actual comments, upvotes, downvotes one per student per pronunciation)
      #-is this a subtype of the above??
end
