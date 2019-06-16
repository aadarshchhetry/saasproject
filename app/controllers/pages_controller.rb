class PagesController < ApplicationController

	def home
      @basic_plan = plan.id(1)
      @pro_plan = plan.id(2)
	end

	def about
	end

end