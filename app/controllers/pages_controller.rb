class PagesController < ApplicationController
	def index
		@joke = Joke.get(:random)
	end
end
