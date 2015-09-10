class Draftee < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  belongs_to :draft
end
