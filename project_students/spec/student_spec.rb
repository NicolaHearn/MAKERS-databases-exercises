require 'student'

describe Student do
  it "returns all records in the database" do
    new_student = Student.new
    new_student.name = "Mary"
    expect(new_student).to be_a Student
    expect(new_student.name).to eq "Mary"
  end
end