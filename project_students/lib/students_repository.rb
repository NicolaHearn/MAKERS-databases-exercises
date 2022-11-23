require_relative 'student'

class StudentRepository
  def all
    result_set = DatabaseConnection.exec_params('SELECT id, name, cohort_name FROM students;', [])
    
    students = []

    result_set.each do |record|
      student = Student.new
      student.id = record['id']
      student.name = record['name']
      student.cohort_name = record['cohort_name']

      students << student
    end
  return students
  end

  # def create(student)
  #   insert = DatabaseConnection.exec_params('INSERT INTO students(name, cohort_name) VALUES(#{student.name}, #{student.cohort_name});', [])
  # end
end