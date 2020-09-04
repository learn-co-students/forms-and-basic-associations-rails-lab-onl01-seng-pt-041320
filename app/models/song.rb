class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def note_contents=(array)
    array.each do |content|
      note = Note.new(content: content)
      self.notes << note
    end
  end

end
