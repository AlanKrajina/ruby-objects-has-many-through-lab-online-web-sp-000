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
  
  def selected
    Appointment.all.select do |patient|
      patient.doctor == self
    end
  end
  
    def patients
    selected.map do |selec|
      selec.patient
    end
  end
end