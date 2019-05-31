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

#  1) Doctor #patients has many patients, through appointments
#     Failure/Error: expect(doctor_who.patients).to include(hevydevy)
#
#       expected ["Friday, January 32nd"] to include #<Patient:0x0000000001a50978 @name="Devin Townsend">
