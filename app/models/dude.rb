class Dude < ActiveRecord::Base
  belongs_to :company
  has_many :tweets
  has_many :mentions
  attr_accessible :username
end
