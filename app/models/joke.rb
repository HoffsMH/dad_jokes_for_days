class Joke < ActiveRecord::Base
  validates :lead, :punchline, uniqueness: true, presence: true

  # def self.random_joke
  #   Joke.all.sample
  # end

end
