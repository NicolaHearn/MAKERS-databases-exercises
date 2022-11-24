class PostRepository
    def all
      sql = 'SELECT id, title, content, views FROM posts;'
    
      result_set = DatabaseConnection.exec_params(sql, [])
        
      posts = []
    
      result_set.each do |record|
        post = Post.new
        post.id = record['id']
        post.title = record['title']
        post.content = record['content']
        post.views = record['views']
    
        posts << post
      end
        return posts
    end

    def find(id)
      sql = 'SELECT id, title, content, views FROM posts WHERE id = $1;'
      params = [id]

      result_set = DatabaseConnection.exec_params(sql, params)

      post = Post.new
      post.id = result_set[0]['id']
      post.title = result_set[0]['title']
      post.content = result_set[0]['content']
      post.views = result_set[0]['views']

      return post
    end

    def create(post)
      sql = 'INSERT INTO posts (title, content, views) VALUES ($1, $2, $3);'
      params = [post.title, post.content, post.views]

      result_set = DatabaseConnection.exec_params(sql, params)
    end

    def delete(id)
      sql = 'DELETE FROM posts WHERE id = $1;'
      params = [id]

      result_set = DatabaseConnection.exec_params(sql, params)
    end
end