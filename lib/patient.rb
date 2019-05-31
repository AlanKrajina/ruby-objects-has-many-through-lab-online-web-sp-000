class Patient
  attr_accessor :name
  @@all=[]
  
  def initialize(name)
    @name = name
    @@all << self
    @apps = []
  end
  
  def self.all
    @@all
  end

  def new_appointments(doctor,date)
   appointment = Appointment.new(self,doctor,date)
   appointment.patient = self
   @apps << appointment
   appointment
  end

  def appointments
  @apps
  end

  def appointments
    Appointment.all.select do |app|
      app.patient == self
    end
  end
  
  def doctors
    appointments.map do |pat|
      pat.doctor
    end
  end
end