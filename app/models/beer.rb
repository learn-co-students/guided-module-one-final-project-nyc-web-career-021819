class Beer < ActiveRecord::Base

  has_many :users, through: :favorite

end
