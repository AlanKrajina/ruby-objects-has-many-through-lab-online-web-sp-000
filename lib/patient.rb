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

  def new_appointments(doctor,date)
   appointment = Appointment.new(doctor,date,)
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