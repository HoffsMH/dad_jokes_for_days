class Joke < ActiveRecord::Base
  validates :lead, :punchline, uniqueness: true, presence: true

end
