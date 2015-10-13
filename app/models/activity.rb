class Activity < ActiveRecord::Base
  belongs_to :trip

  validates :name, presence: true
end
