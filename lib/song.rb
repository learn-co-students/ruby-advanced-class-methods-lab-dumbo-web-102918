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
    tmp = self.new
    @@all << tmp
    @@all.last
  end

  def self.new_by_name(name)
    tmp = self.new
    tmp.name = name
    tmp
  end

  def self.create_by_name(name)
    @@all << self.new_by_name(name)
    @@all.last
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_info = filename.chomp(".mp3").split("-")
    tmp = self.new
    tmp.artist_name, tmp.name = song_info[0].strip, song_info[1].strip
    tmp
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
    @@all.last
  end

  def self.destroy_all
    @@all.clear
  end

end
