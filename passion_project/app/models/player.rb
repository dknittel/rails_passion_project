class Player < ActiveRecord::Base
  belongs_to :pool
  has_many :draftees
  validates :name, presence: true, uniqueness: true
end
