require "pry"

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
    appointment = Appointment.new(date,self,patient)
    @appointments << appointment
    appointment.doctor = self
    appointment
  end
  
  def appointments
    @appointments
  end
  
  def selected  #returns matched appointment.doctor to SELF (this)
    Appointment.all.select do |app|
      app.doctor == self
    end
  end
      binding.pry

  def patients #returns same doctor = apointment + = patient
    selected.map do |selec|
      selec.patient
    end
  end
end