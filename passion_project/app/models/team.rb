class Team < ActiveRecord::Base
  belongs_to :draft
  has_many :draftees
end
