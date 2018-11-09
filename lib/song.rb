require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
# def initialize(name)
#   @name = name
# end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  @song  = self.new
    @song.save
    @song
  end

  def self.new_by_name(name)
@song = self.new
@song.name = name
@song
end

def self.create_by_name(name)
song = self.new
song.name = name
# binding.pry
@@all << song
song
end

def self.find_by_name(name)
  @@all.find do |song|
    song.name == name
end
end

 def self.find_or_create_by_name(name)
   if Song.find_by_name(name) != nil
     Song.find_by_name(name)
   else
     Song.create_by_name(name)
   end
 end

def self.alphabetical
@@all.sort_by {|object| object.name}
end

def self.new_from_filename(mp3_data)
  data = mp3_data.split(/\s-|\.mp3/)
      artist_name = data[0].strip
      name  = data[1].strip

      song = Song.new
      song.name = name
      song.artist_name = artist_name
      song
      # binding.pry
end
def self.create_from_filename(mp3_data)
song = Song.new_from_filename(mp3_data)
@@all << song
end
def self.destroy_all
  @@all = []
end


end
   # song1 = Song.create_by_name("Blank Space")
   # song2 = Song.create_by_name("Basas")
   # song3 = Song.create_by_name("hustle")
   # song4 = Song.create_by_name("dance")
   # song5 = Song.create_by_name("Bpp")
   # song6 = Song.create_by_name("Boooe")
   #
   #    binding.pry
