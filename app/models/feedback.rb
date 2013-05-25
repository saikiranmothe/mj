class Feedback < ActiveRecord::Base
  attr_accessible :details, :user_id
  belongs_to :user
end
