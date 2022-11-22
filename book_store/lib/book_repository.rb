require_relative 'book'

class BookRepository
    def all
    # Executes the SQL query:
    sql = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])

    books = []

    result_set.each do |book|
        book_1 = Book.new
        book_1.id = book['id']
        book_1.title = book['title']
        book_1.author_name = book['author_name']

        books << book_1
    end

    return books
    end
end