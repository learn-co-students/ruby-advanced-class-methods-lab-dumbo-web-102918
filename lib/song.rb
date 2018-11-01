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

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
  song = self.new
  song.name = name
  song
    end

    def self.create_by_name(name)
      song = self.create
      song.name = name
      song
    end
    def self.find_by_name(name)
      @@all.find {|song_ins| song_ins.name == name}
    end
    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)

      end

      def self.alphabetical
        @@all.sort_by{|song_ins| song_ins.name}
      end
      def self.new_from_filename(str)
        song = str.slice(0, str.length-4)

        song_arr = song.split(" - ")
        singer = song_arr[0]
        title = song_arr[1]

        new_song = self.new
        new_song.name = title
        new_song.artist_name = singer

        new_song
      end
      def self.create_from_filename(song)
        new_song = new_from_filename(song)
        new_song.save
      end
      def self.destroy_all
        self.all.clear
      end

end
