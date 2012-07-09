class Mention < ActiveRecord::Base
  belongs_to :dude
  attr_accessible :body, :created_at, :twitter_id
end
