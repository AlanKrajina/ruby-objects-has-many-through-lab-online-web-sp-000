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
 #     binding.pry

  def patients #returns patient with same doctor = apointment 
    selected.map do |selec|
      selec.patient
    end
  end
end

#  1) Doctor #patients has many patients, through appointments
#     Failure/Error: expect(doctor_who.patients).to include(hevydevy)
#
#       expected ["Friday, January 32nd"] to include #<Patient:0x0000000001a50978 @name="Devin Townsend">