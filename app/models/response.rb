class Response < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :exercise
end
