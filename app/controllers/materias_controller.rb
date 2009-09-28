class MateriasController < ApplicationController
	layout 'apyweb'
	before_filter :login_required, :except => [ :index, :lista ]
	
	def index
		lista
		render :action => 'lista'
	end
	
	def lista
		@materias = Materia.find(:all)
	end

	def nueva
		@materia = Materia.new
	end
	
	def editar
		@materia = Materia.find(params[:id])
	end
	
	def update
		@materia = Materia.find(params[:id])
		@materia.attributes = params[:materia]
		flash[:notice] = "Materia #{@materia.name} modificada!" if @materia.save
		redirect_to :action => 'lista'
	end
	
	def destroy
		materia = Materia.find(params[:id])
		experts = materia.experts
		materia.experts.each {|e| e.materias.delete materia}
		flash[:notice] = "Materia '#{materia.name}' borrada!"
		materia.destroy
		redirect_to :action => 'lista'
	end
	

	def create	
		@materia = Materia.new(params[:materia])
		if @materia.save
			flash[:notice] = 'Se ha añadido una nueva materia'
			redirect_to :action => 'lista'
		else
			render:action => 'new'
		end
	end
end
