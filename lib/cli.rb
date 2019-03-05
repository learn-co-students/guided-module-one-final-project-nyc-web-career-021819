class CommandLineInterface
  def greet
    puts "Welcome to the GitHub Repo Explorer"
    puts "We can help you find your github repos."
  end

  def gets_user_input
    gets.chomp
  end

  def username_exists?(github_username)
    !!User.all.find_by(github_username: github_username)
  end

  def already_on_repo?(user, repo)
    repo.users.include?(user)
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
    # input = gets_user_input
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
          # Give user options:
          #  Remove user from repo
          #  Add another user to repo
            # Enter username to add
          #  Delete repo?

    puts "2. Find all projects with a keyword"
      # Enter the keyword that you're looking for
       # => returns array ["1. Project 1", "2. Project 2"] or "No repos found with this keyword"
                # Prompt: Select repo number to view repo details
                  # (user chooses 1, 2, 3, etc.) => returns [name: "Project 1", desc: "blah blah"] for example
                      #  1. Remove user from repo
                      #  2. Add user to repo
                        #  => Enter username to add
                            # If user already part of repo, puts "user already on repo"
                            # If not, add user to repo
                                # => "user added to repo"
                                  # loops back to 2.
                      #  3. Delete repo?

    puts "3. Find all collaborators for a project"
      # 3a. "Enter a project name"
      # 4.
    main_menu_loop
  end
  #
  def main_menu_loop
    while user_input != "exit"
      case @last_input.to_i
      when 1
        puts "Enter a github username **WITH EXACT CAPITALIZATION** to list that user's projects:"
        input = gets_user_input
        user = find_user(input)
        repos = find_repos(user)
        show_repos(repos)
        puts "Select repo number to view repo details"
        input = gets_user_input
        selected_repo = repos[input.to_i - 1]
        user_repo = find_user_repo(user, selected_repo)
        # puts "Repo name:" + repos[input.to_i - 1].project_name + " " + repos[input.to_i - 1].description
        puts "Repo name: #{repos[input.to_i - 1].project_name}"
        puts "Description: #{repos[input.to_i - 1].description}"
        puts "What would you like to do?"
        puts "1. Remove current user from repo"
        puts "2. Add another user to repo"
        puts "3. Delete repo"
        while user_input != "exit"
          case @last_input.to_i
          when 1
            UserRepo.destroy(user_repo.id)
            puts "Deleted #{user.name} from #{selected_repo.project_name}!"
            break
          when 2
            puts "Who do you want to add? (enter username with *EXACT* spelling and capitalization):"
            input = gets_user_input
            puts input
            user = find_user(input)
            # binding.pry

            if username_exists?(user.github_username)
              if already_on_repo?(user, selected_repo)
                puts "#{user.name} is already working on #{selected_repo.project_name}"
              else
                user.repos << selected_repo
                selected_repo.users.each {|user| puts user.github_username}
              end
            end
            break
          when 3
            puts "entered 3"
          end
        end
        break
      when 2
        # post_index
        puts "still in menu loop"
        break
      else
        menu
        break
      end
    end
  end

  def find_user_repo(user, repo)
    UserRepo.find_by("user_id = ? AND repo_id = ?", user.id, repo.id)
  end

  # def remove_user_from_repo(user_repo)
  #   user_repo.destroy
  # end


  def find_repos(user)
    user.repos
  end

  def show_repos(repos)

    repos.each_with_index do |repo, index|
      puts "#{index+1}. #{repo.project_name}"
    end

  end

  def find_repo_by_keyword(keyword)
    Repo.all.select do |repo|
      repo.description.include?(keyword)
    end
  end

  def user_input
    @last_input = gets.strip
  end

end
