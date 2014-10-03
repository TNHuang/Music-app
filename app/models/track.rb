class Track < ActiveRecord::Base
  validates :name, :album_id, :bonus_or_regular, presence: true
  validates_inclusion_of :bonus_or_regular, in: ["BONUS", "REGULAR"]

  belongs_to :album,
  class_name: "Album",
  foreign_key: :album_id,
  primary_key: :id

end