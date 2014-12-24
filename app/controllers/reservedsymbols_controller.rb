class ReservedsymbolsController < ApplicationController
	def new
	end

	def create
		@reservedsymbol = Reservedsymbol.create(reservedsymbol_params)
		render "show"
	end

	def show
		unless @reservedsymbol = Reservedsymbol.where(id: 1).first
			render "new"
		end
	end

	def edit
		@reservedsymbol = Reservedsymbol.where(id: 1).first
	end

	def update
		@reservedsymbol = Reservedsymbol.find(1)
		@reservedsymbol.update_attributes(reservedsymbol_params)
		if @reservedsymbol.errors.empty?
			redirect_to reservedsymbol_path(1)
		else 
			flash.now[:error] = "Поле не может быть пустым!"
			render "edit"
		end
	end

	private

		def reservedsymbol_params
			params.require(:reservedsymbol).permit(:symbols)
		end
end
