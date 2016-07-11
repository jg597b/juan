class Artist < ActiveRecord::Base
  has_many :songs
  has_many :albums, through: :songs
  
  validates :name, presence: true

  def profile_image_present?
    image_url.present?
  end
end
