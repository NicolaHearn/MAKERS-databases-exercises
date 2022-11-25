require 'app'

class Menu
  def initialize(io)
    @io = io
  end

  def run_menu
    @io.puts "Welcome to the social media manager!\n\nWhat would you like to do? (type 1 or 2)\n\n1 - List all users\n2 - List all posts"
    
    menu_choice = @io.gets.chomp
  
    if menu_choice == "1"
      # results = AlbumRepository.new
      # results.all.each do |record|
        # @io.puts "#{record.id} - #{record.title} - #{record.release_year}"
        @io.puts "This prints a list of users"
    #  end
    elsif menu_choice == "2"
      # results = ArtistRepository.new
      # results.all.each do |record|
        # @io.puts "#{record.id} - #{record.name} - #{record.genre}"
        @io.puts "This prints a list of posts"
     # end
   end
  end
end



describe 'app' do
  it "asks user for input and returns list of users" do
    io = double :io

    results = UserRepository.new
      
    expect(io).to receive(:puts).with("Welcome to the social media manager!\n\nWhat would you like to do? (type 1 or 2)\n\n1 - List all users\n2 - List all posts")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("This prints a list of users")

  menu = Menu.new(io)
  menu.run_menu

  end
  it "asks user for input and returns list of posts" do
    io = double :io

    results = PostRepository.new
      
    expect(io).to receive(:puts).with("Welcome to the social media manager!\n\nWhat would you like to do? (type 1 or 2)\n\n1 - List all users\n2 - List all posts")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("This prints a list of posts")

    menu = Menu.new(io)
    menu.run_menu
  end
end