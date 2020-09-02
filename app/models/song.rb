class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note=(content)
    content.each do |content|
      if !content.empty?
        self.notes << Note.find_or_create_by(content: content)
      end
    end
  end

  def note
    self.notes.map do |note|
      note.content
    end
  end
end
