class Doctor
  attr_reader :name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @appointments = []
  end
  
  def self.all
    @@all
  end
  
  def new_appointment(date,patient)
    appointment = Appointment.new(date,patient)
    @appointments << 
    
  end
  
end