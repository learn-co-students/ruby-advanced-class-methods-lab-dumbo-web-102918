require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  ###Create new song and save in class variable
  def self.create
    song = self.new
    self.all << song
    song
  end

  ###create new song by name
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
      # binding.pry
  end


  ###create song and save in class variable
  def self.create_by_name(name)
    self.all << self.new_by_name(name)
    self.all.last
  end

  ###find song by name
  def self.find_by_name(name)
    self.all.find {|song|song.name==name}
  end


  ###find or create song
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      return song
    else
      self.create_by_name(name)
    end

  end

  ###sort the songs in alphabetical order
  def self.alphabetical
    self.all.sort_by {|song|song.name.downcase}
  end

  ### Create new song from filename
  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    artist = song_info[0]
    song_name = song_info[1].split(".").first
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end


  ###Create new song from filename and save it in class variable
  def self.create_from_filename(filename)
    self.all <<  self.new_from_filename(filename)
  end

  ###Clear all songs from the class variable .
  def self.destroy_all
    self.all.clear
  end

end
