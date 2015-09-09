class Draft < ActiveRecord::Base
  belongs_to :user
  belongs_to :pool
  has_many :teams
end
