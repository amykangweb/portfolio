class User < ActiveRecord::Base
  has_many :articles, foreign_key: "author_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def editor?
    role == "editor"
  end

  def author?
    role == "author"
  end
end

class NullUser
  def editor?
    false
  end

  def author?
    false
  end
end
