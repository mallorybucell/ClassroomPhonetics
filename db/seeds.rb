require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |t|
  t = User.new
  t.email = Faker::Internet.email
  t.password = "password"
  t.teacher = true
  t.save
    2. times do |c|
      c = Course.new
      c.course_name = Faker::Commerce.department
      c.internal_id = Faker::Address.building_number.to_i
      c.semester = "Fall"
      c.year = "2015"
      c.save
      uc = UserCourse.new
      uc.user_id = t.id
      uc.course_id = c.id
      uc.user_role = "teacher"
      uc.save
    end
  end

5.times do |s|
  s = User.new
  s.email = Faker::Internet.email
  s.password = "password"
  s.student = true
  s.save
    2. times do |c|
      c = Course.new
      c.course_name = Faker::Commerce.department
      c.internal_id = Faker::Address.building_number.to_i
      c.semester = "Fall"
      c.year = "2015"
      c.save
      uc = UserCourse.new
      uc.user_id = s.id
      uc.course_id = c.id
      uc.user_role = "student"
      uc.save
    end
  end
