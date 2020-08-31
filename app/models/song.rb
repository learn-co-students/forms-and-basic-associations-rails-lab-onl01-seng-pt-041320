class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name 
    genre&.name  
  end 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name 
    self.artist ? self.artist.name : nil
  end 

  def note_contents=(contents)
    contents.each do |text|
      unless text == ""
      note = Note.create(content: text)
      notes << note
      end
    end
  end

end
