tony = User.create(name: "Tony Chang", mod: 1, github_username: "tchang9", profile_url: "https://github.com/tchang9/")
dave = User.create(name: "Dave Korff", mod: 1, github_username: "davekorff", profile_url: "https://github.com/davekorff/")
alonso = User.create(name: "Alonso Ortega", mod: 1, github_username: "aort93", profile_url: "https://github.com/aort93/")
nicky = User.create(name: "Nicky Dover", mod: 1, github_username: "NickyEXE", profile_url: "https://github.com/NickyEXE/")

project_1 = Repo.create(project_name: "Project 1", description: "First Project", repo_url: "https://github.com/davekorff/guided-module-one-final-project-nyc-web-career-021819")
project_2 = Repo.create(project_name: "Project 2", description: "Second Project", repo_url: "https://github.com/nickyexe/module-one-final-project-guidelines-nyc-web-career-021819")
project_3 = Repo.create(project_name: "Project 3", description: "Third Project (evolved second project)", repo_url: "https://github.com/nickyexe/module-one-final-project-guidelines-nyc-web-career")
project_4 = Repo.create(project_name: "Project 4", description: "Fourth Project (evolved second project 2)", repo_url: "https://github.com/nickyexe/module-one-final-project-guidelines-nyc")

tony.repos << project_1
dave.repos << project_1
project_2.users << alonso
project_2.users << nicky
