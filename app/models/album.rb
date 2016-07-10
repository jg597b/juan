class Album < ActiveRecord::Base
  belongs_to :publisher
  has_many :songs
  
  validates :name, presence: true, length: { in: 2..50 }
  validates :cover_art, presence: true
  validates :released_on, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "should be in the format YYYY-MM-DD" }
  scope :latest_released, -> {order('released_on DESC').first}
  scope :recent, -> (n) { where(released_on: ((Date.today - 4.months)..Date.today)).last(n) }
end
