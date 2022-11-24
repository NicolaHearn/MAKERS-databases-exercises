class UserRepository
  def all
    sql = 'SELECT id, username, email FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    users = []

    result_set.each do |person|
      user = User.new
      user.id = person['id']
      user.username = person['username']
      user.email = person['email']

      users << user
    end

    return users
  end  

  def find(id)
    sql = 'SELECT id, username, email FROM users WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)

    user = User.new
    user.id = result_set[0]['id']
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']

    return user
  end
end