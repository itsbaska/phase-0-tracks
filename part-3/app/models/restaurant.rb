class Restaurant < ActiveRecord::Base

  has_many :reviews
  belongs_to :user

  validates :name, :location, :cuisine_type, presence: true

end
