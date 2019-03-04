class CommandLineInterface
  def greet
    puts "Welcome to the GitHub Repo Explorer"
  end

  def gets_user_input
    puts "We can help you find your github repos."
    puts "Enter a github username to get started:"
    user_input = gets.chomp
    user_input
  end

  def find_user(github_username)
    # binding.pry
    user = User.all.find_by(github_username: github_username)
    # puts user
  end

  def run
    greet
    input = gets_user_input
    user = find_user(input)
    repos = find_repos(user)
    show_repos(repos)
  end

  def find_repos(user)
    user.repos
  end

  def show_repos(repos)
    repos.each do |repo|
      puts repo.project_name
    end
  end

end
