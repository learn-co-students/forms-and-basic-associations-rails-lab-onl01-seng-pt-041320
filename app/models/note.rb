class Note < ActiveRecord::Base
  belongs_to :song
  has_many :genres, through: :songs
  has_many :artists, through: :songs 
end
