class User < ActiveRecord::Base

  has_many :beers, through: :favorite

end
