require_relative 'database_connection'

class User

  attr_reader :id, :email, :name, :username, :password

  def initialize(id, email, name, username, password)
    @id = id.to_i
    @email = email
    @name = name
    @username = username
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['name'], user['username'], user['password']) }
  end

  def self.create(name, username, email, password)
    DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}');")
  end

  # def self.find(id)
  #   result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
  #   # User.new(result[-1]['id'], result[-1]['name'], result[-1]['username'], result[-1]['email'], result[-1]['password'])
  # end

end
