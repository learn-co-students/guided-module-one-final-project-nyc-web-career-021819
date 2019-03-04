class CommandLineInterface
  def greet
    puts "Welcome to the GitHub Repo Explorer"
  end

  def gets_user_input
    puts "We can help you find your github repos."
    puts "Enter a github username **WITH EXACT CAPITALIZATION** to list that user's projects:"
    gets.chomp
  end

  def username_exists?(github_username)
    !!User.all.find_by(github_username: github_username)
  end

  def find_user(github_username)
    if username_exists?(github_username)
      User.all.find_by(github_username: github_username)
    else
      puts "That user doesn't exist! (or doesn't exist by that exact username)"
    end
  end

  def run
    greet
    input = gets_user_input
    user = find_user(input)
    repos = find_repos(user)
    show_repos(repos)
    puts find_repo_by_keyword("First")[0].project_name
    run
  end


  def find_repos(user)
    user.repos
  end

  def show_repos(repos)
    repos.each do |repo|
      puts repo.project_name
    end
  end

  def find_repo_by_keyword(keyword)
    Repo.all.select do |repo|
      repo.description.include?(keyword)
    end
  end


end
