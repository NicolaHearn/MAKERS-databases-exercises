require 'movie_repository'

describe MovieRepository do
    def reset_movies_table
      seed_sql = File.read('spec/seeds.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'movies_test' })
      connection.exec(seed_sql)
    end
        
    before(:each) do 
      reset_movies_table
    end
    
    it "returns all movies in the database" do
        repo = MovieRepository.new
    
        movies = repo.all
    
        expect(movies.length).to eq(2)
        expect(movies.first.id).to eq('1')
        expect(movies.first.title).to eq('Lord of the Rings')
        expect(movies.first.genre).to eq('Fantasy')
        expect(movies.first.release_year).to eq('2001')
    end

    it "returns searches for and returns a specific entry based on the id" do 
        repo = MovieRepository.new

        movie = repo.find(1)
        
        expect(movie.title).to eq('Lord of the Rings')
    end
end
