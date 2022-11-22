require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('students')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, name, cohort_name FROM students;'
result = DatabaseConnection.exec_params('SELECT * FROM students', [])

# Print out each record from the result set .
result.each do |record|
  p record
end