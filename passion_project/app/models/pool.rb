class Pool < ActiveRecord::Base
  has_many :drafts
  has_many :players
end
