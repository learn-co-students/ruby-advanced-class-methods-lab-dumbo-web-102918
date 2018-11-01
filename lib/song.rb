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

  def Song.create
    song = Song.new
    song.save
    song
  end

  def Song.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def Song.create_by_name(song_name)
    song = Song.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song_info = filename[0..-5].split(" - ")
    song = create_by_name(song_info[1])
    song.artist_name = song_info[0]
    song
  end

  def Song.create_from_filename(filename)
    song = new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
