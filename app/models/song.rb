class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # Return Song.artist.name IFF Song.artist exists
  def artist_name 
    self.artist ? self.artist.name : nil
  end

  # if there is an artist name passed then find/create by that said name for artist
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name) 
    self.save
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.save
  end

  def note_contents
    self.notes.collect(&:content)
  end

  def note_contents=(note_contents)
    note_contents.each do |c|
      
    end
  end

end
