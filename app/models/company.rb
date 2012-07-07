class Company < ActiveRecord::Base
  has_many  :dudes
  attr_accessible :name
end
