require "pry"

class Artist
  attr_reader :name
  @@all=[]
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def self.all
    @@all
  end

  def new_song(name,genre)
    song = Song.new(name,self,genre)
    @songs << song
    song.artist = self
    song
  end
  
  def songs
    @songs
  end
  
  def songsy
    Song.all.select do |song|
      song.artist == self
    end
  end
 
  def genres
    songsy.map do |genr|
      genr.genre
    end
  end
end


