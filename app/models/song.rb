class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
      self.try(:artist).try(:name)
    # self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
     # self.try(:genre).try(:name)
     self.genre ? self.genre.name : nil
  end

  def note=(contents)
    contents.each do |x|
      if !x.empty?
        # note = self.notes.new(content: x)
        # self.notes << note
        self.notes.new(content: x)
      end
    end
  end

  def note
    self.notes.map do |note|
      note.content
    end
  end

end