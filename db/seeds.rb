beers = Beer.create([
    {:name => "Coors Light", :style => "Blonde Ale", :description => "Wow so gud"},
    {:name => "Budwhysir?", :style => "Pale Ale", :description => "Wow so bad"},
    {:name => "Stella!!", :style => "Stout", :description => "Wow so gud Really"},
    {:name => "PBR", :style => "Saison", :description => "Wow so sour!"},
    {:name => "Sapparo", :style => "Pilsner", :description => "Wow so Japanese!"}
])


users = User.create([
  {:first_name => "Rich", :last_name => "Tam"},
  {:first_name => "Khaled", :last_name =>"Khalifeh"}
])


favorites = Favorite.create([
  {:user_id => 1, :beer_id => 3},
  {:user_id => 2, :beer_id => 2},
  {:user_id => 1, :beer_id => 4},
  {:user_id => 2, :beer_id => 4}

])
