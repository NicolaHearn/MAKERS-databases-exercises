require 'user_repository'
require 'user'

describe UserRepository do
  def reset_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end
  before(:each) do 
  reset_tables
  end
  describe '#all' do
    it "returns all records from the database" do
      repo = UserRepository.new

      users = repo.all
    
      expect(users.length).to eq 2
    
      expect(users[0].id).to eq '1'
      expect(users[0].username).to eq 'Harry Potter'
      expect(users[0].email).to eq 'harry94@gmail.com'
    
      expect(users[1].id).to eq '2'
      expect(users[1].username).to eq 'Ariel'
      expect(users[1].email).to eq 'theMermaid@seamail.com'
    end
  end

  describe "#find" do
    it "returns a single entry by searching for the id" do
      repo = UserRepository.new

      user = repo.find(2)
      
      expect(user.id).to eq '2'
      expect(user.username).to eq 'Ariel'
      expect(user.email).to eq 'theMermaid@seamail.com'
    end
  end
end