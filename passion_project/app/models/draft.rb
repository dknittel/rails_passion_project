class Draft < ActiveRecord::Base
  belongs_to :user
  belongs_to :pool
  has_many :teams
  has_many :draftees
end
