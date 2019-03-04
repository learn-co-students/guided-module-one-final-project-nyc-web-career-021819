class CommandLineInterface
  def greet
    puts "Welcome to the GitHub Repo Explorer"
  end

  def gets_user_input
    puts "We can help you find your github repos."
    puts "Enter a github username to get started:"
    gets.chomp
  end
end
