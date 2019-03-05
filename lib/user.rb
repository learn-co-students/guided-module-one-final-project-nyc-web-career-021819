class User < ActiveRecord::Base
  has_many :user_repos
  has_many :repos, through: :user_repos


  def sanitize_username
    new_user = User.new()
  end
end
