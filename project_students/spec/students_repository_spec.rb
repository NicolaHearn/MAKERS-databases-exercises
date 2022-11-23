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

    students = repo.all

    expect(students.length).to eq 2
    expect(students[0].id).to eq '1'
    expect(students[0].name).to eq 'Stephanie Morgan'
    expect(students[0].cohort_name).to eq 'tigers'
    expect(students[1].id).to eq '2'
    expect(students[1].name).to eq 'Mary-Jane Smith'
    expect(students[1].cohort_name).to eq 'cuckoos'
  end
end
