class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = Song.new
    song.save
    song
  end
  
  def Song.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def Song.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end
  
  def Song.find_by_name(song)
    @@all.find{|element| element.name == song}
  end
  
  def Song.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end
  
  def Song.alphabetical
    @@all.sort{|a,b| a.name<=>b.name}
  end

  def Song.new_from_filename(filename)
    file = filename.split(" - ")
    song = Song.new
    song.name = file[1][0...-4]
    song.artist_name = file[0]
    song
  end
  
  def Song.create_from_filename(filename)
    file = filename.split(" - ")
    song = Song.new
    song.name = file[1][0...-4]
    song.artist_name = file[0]
    song.save
    song
  end
  
  def Song.destroy_all
    @@all = []
  end
end
