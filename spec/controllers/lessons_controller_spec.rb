require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

  it 'can create lessons' do
    teacher = FactoryGirl.create :user
    course =  FactoryGirl.create :course
    FactoryGirl.create :user_course, course_id: course.id, user_id: teacher.id, user_role: "teacher"
    
    login teacher
    description = "Posting from test spec."
    post :create, course_id: course.id, description: description

    expect(course.lessons.count).to eq 1
    expect(course.lessons.first.description).to eq description
  end

  it 'can display lessons'

  it 'can update lessons'

  it 'can submit lessons'

  it 'does not allow lesson updating if lesson is currently assigned to students'

  it 'handles errors gracefully'

end
