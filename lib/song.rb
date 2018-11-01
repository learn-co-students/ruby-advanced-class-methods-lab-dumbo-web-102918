require "pry"


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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end


  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end


  def self.find_or_create_by_name(name)
   if self.find_by_name(name) == nil
     self.create_by_name(name)
   else self.find_by_name(name)
   end
 end

  def self.alphabetical
    sorted_songs = @@all.sort do |a ,b|
      a.name <=> b.name
    end
  end


  def self.new_from_filename(filename)
    split_file = filename.split('-')
    artist_name = split_file[0][0..-2]
    name = split_file[1][1..-5]
    song = self.create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song =self.new_from_filename(filename)
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end 

end
