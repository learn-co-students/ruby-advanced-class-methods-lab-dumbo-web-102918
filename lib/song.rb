require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize(name)
      @name = name
      @@all.push(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new(name)
  end

  def self.new_by_name (name)
    song = Song.new(name)
  end

  def self.create_by_name (name)
    song = Song.new(name)
  end

  def self.find_by_name (name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name (name)
    if self.find_by_name(name) == nil
      return self.create_by_name(name)
    else
      return self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    song = Song.new(file_name)
    array = song.name.split(" - ")
    puts array
    array2 = array[1].split(".")
    new_song = self.create_by_name(array2[0])
    new_song.artist_name = array[0]
    new_song
  end

  def self.create_from_filename (file_name)
    song = Song.new(file_name)
    array = song.name.split(" - ")
    puts array
    array2 = array[1].split(".")
    new_song = self.create_by_name(array2[0])
    new_song.artist_name = array[0]
    new_song
  end

  def self.destroy_all
    @@all.clear
  end



end
