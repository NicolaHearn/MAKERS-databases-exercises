require 'book_repository'
# require_relative 'app'

describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end
      
  before(:each) do 
    reset_books_table
  end

  it "returns all records in the database" do
  repo = BookRepository.new

  books = repo.all

  expect(books.length).to eq 2
  expect(books[0]["id"]).to eq "1"
  expect(books[0]["title"]).to eq 'Harry Potter'
  expect(books[0]["author_name"]).to eq 'J.K. Rowling'
  expect(books[1]["id"]).to eq "2"
  expect(books[1]["title"]).to eq 'The Woman in White'
  expect(books[1]["author_name"]).to eq 'Wilkie Collins'
#   expect(app).to eq "1 - Harry Potter - J.K. Rowling/n2 - The Woman in White - Wilkie Collins"
  end 
end