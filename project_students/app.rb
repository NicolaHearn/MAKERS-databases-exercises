require_relative 'lib/database_connection'
require_relative 'lib/students_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('students')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, name, cohort_name FROM students;'
result = DatabaseConnection.exec_params('SELECT * FROM students', [])

query = StudentRepository.new

all_students = query.all

# Print out each record from the result set .
all_students.each do |record|
  puts "#{record.id} - #{record.name} - #{record.cohort_name}"
end