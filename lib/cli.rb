class CommandLineInterface
  def greet
    puts "Welcome to the GitHub Repo Explorer"
    puts "We can help you find your github repos."
  end

  def gets_user_input
    # puts "Enter a github username **WITH EXACT CAPITALIZATION** to list that user's projects:"
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
    menu
    input = gets_user_input
    # user = find_user(input)
    # repos = find_repos(user)
    # show_repos(repos)
    # puts find_repo_by_keyword("First")[0].project_name
  end

  def menu
    puts "What would you like to do?"
    puts "1. Find all projects by username"
      # returns array ["1. Project 1", "2. Project 2"]
      # Select repo number to view repo details
        # => [name: "Project 1", desc: "blah blah"]
          #  Remove user from repo
          #  Add another user to repo
            # Enter username to add
          #  Delete repo?

    puts "2. Find all projects with a keyword"
      # Enter the keyword that you're looking for
       # => returns array ["1. Project 1", "2. Project 2"] or "No repos found"
       # Select repo number to view repo details
         # => [name: "Project 1", desc: "blah blah"]
           #  Remove user from repo
           #  Add user to repo
             # Enter username to add
                # If user already part of repo, puts "user already on repo"
                # If not, add user to repo
           #  Delete repo?

    puts "3. Find all collaborators for a project"
      # 3a. "Enter a project name"
      # 4.
    # main_menu_loop
  end
  #
  # def main_menu_loop
  #   while user_input != "exit"
  #     case last_input.to_i
  #     when 1
  #       post_new
  #       break
  #     when 2
  #       post_index
  #       break
  #     else
  #       menu
  #       break
  #     end
  #   end
  # end


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
