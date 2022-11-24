require 'post_repository'
require 'post'

describe PostRepository do
  def reset_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_tables
  end
  describe "#all" do
    it "returns all entries from the posts table" do
      repo = PostRepository.new

      posts = repo.all
  
      expect(posts.length).to eq 4
  
      expect(posts[0].id).to eq '1'
      expect(posts[0].title).to eq 'spells for wicked kids'
      expect(posts[0].content).to eq 'spell 1'
      expect(posts[0].views).to eq '24'
    
      expect(posts[2].id).to eq '3'
      expect(posts[2].title).to eq 'How to be human'
      expect(posts[2].content).to eq 'using a fork'
      expect(posts[2].views).to eq '345'
    end
  end
  describe "#find" do
    it "returns a single entry by searching for the id" do
      repo = PostRepository.new

      post = repo.find(2)
    
      expect(post.id).to eq '2'
      expect(post.title).to eq 'spells for funny kids'
      expect(post.content).to eq 'spell 2, spell 3'
      expect(post.views).to eq '39'
    end
  end
  describe "#create" do
    it "creates a new record in the database" do
      repo = PostRepository.new

      new_post = Post.new
      new_post.title = 'Turn a frog into a princess'
      new_post.content = 'Part 1, prepare your ingredients....'
      new_post.views = 45
        
      query = repo.create(new_post)
        
      posts = repo.all
      post = repo.find(5)  
      
      expect(posts.length).to eq 5
      expect(post.title).to eq 'Turn a frog into a princess'
    end
  end
  describe "#delete" do
    it "deletes a record from the database" do
      repo = PostRepository.new

      repo.delete(1)
    
      posts = repo.all
    
      expect(posts.length).to eq 3
    end
  end
end