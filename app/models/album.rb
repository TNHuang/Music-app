class Album < ActiveRecord::Base
  LOS = ["LIVE", "STUDIO"]
  validates :name, :band_id, :live_or_studio, presence: true
  validates_inclusion_of :live_or_studio, in: LOS

  belongs_to :band,
  class_name: "Band",
  foreign_key: :band_id,
  primary_key: :id

  has_many :tracks,
  class_name: "Track",
  foreign_key: :album_id,
  primary_key: :id,
  dependent: :destroy

end