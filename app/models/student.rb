class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :user
  belongs_to :school
  belongs_to :division

  has_and_belongs_to_many :attendances
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :picture

  def self.search(search)
    Student.where('name LIKE ? OR email LIKE ? OR contact_no LIKE ?',  "%#{search}%", "%#{search}%", "%#{search}%")
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      email = row[0]
      name = row[1]
      father_name = row[2]
      mother_name = row[3]
      gender = row[4]
      dob = row[5]
      contact_no = row[6]
      user_id = (row[7]).to_i
      school_id = (row[8]).to_i
      division_id = (row[9]).to_i
      password = row[10]
      password_confirmation = row[11]
      Student.create!(email: email, name: name, father_name: father_name, mother_name: mother_name, gender: gender, dob: dob, contact_no: contact_no, user_id: user_id, school_id: school_id, division_id: division_id, password: password, password_confirmation: password_confirmation)
    end
  end
end