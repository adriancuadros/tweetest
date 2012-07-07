class Tweet < ActiveRecord::Base
  belongs_to :dude
  attr_accessible :body, :created_at
end