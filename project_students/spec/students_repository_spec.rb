require 'students_repository'
require 'student'

describe StudentRepository do
  def reset_students_table
    seed_sql = File.read('spec/seeds_students_table.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_students_table
  end
  it "returns all students in the database" do
    repo = StudentRepository.new

    students = repo.all

    expect(students.length).to eq(2)
    expect(students.first.id).to eq('1')
    expect(students.first.name).to eq('Stephanie Morgan')
    
  end

  it "creates a new student record" do
    repo = StudentRepository.new

    student_1 = Student.new
    student_1.name = "Erika"
    student_1.cohort_name = "tigers"

    student_2 = Student.new
    student_2.name = "Sarah"
    student_2.cohort_name = 'lions'

    repo.create(student_1)
    repo.create(student_2)

    expect(all_students).to eq [student_1, student_2]
  end
end
