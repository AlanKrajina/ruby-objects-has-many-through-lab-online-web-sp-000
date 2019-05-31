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
    @appointments << appointment
    appointment.doctor = self
    appointment
  end
  
  def appointments
    @appointments
  end
  
  def patients
    Appointment.all.select do |app|
      app.doctor == self
    end
  end
  
end