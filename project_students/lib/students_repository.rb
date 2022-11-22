require 'student'

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
end