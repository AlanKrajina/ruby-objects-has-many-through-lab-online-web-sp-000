class Patient
  attr_accessor :name
  @@all=[]
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end

  def appointments
    Appointment.all.select do |app|
      app.patient == self
    end
  end
  
#  def artists
#    songs.map do |art|
#      art.artist
#    end
#  end
end