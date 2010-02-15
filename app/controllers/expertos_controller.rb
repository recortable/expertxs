class ExpertosController < ApplicationController
	layout 'apyweb'
	before_filter :login_required, :only => [ :nuevo, :create, :update, :editar, :login, :destroy ]

  caches_page :ver

	def index
    redirect_to :action => 'lista'
	end

  def login
    redirect_to :action => 'lista'
  end
	
	def muestra
		term = params[:query].to_s
		column = params[:column].to_s
		if term.length > 0
			@experts = Expert.find(:all, :conditions => ["#{column} = ?", term], :order => 'name ASC')
			@filter = "los expert@s con '#{COLUMN_NAMES[column.to_sym]}' igual a '#{term}'"
		else
			lista
		end
		render :action => 'lista'
	end

	def search 
		term = params[:query].to_s
		if term.length > 0
			@experts = Expert.find_with_ferret(term)
			extras = Extra.find_with_ferret(term)
			extras.each{|extra| @experts << extra.expert}
			@filter = "los resultados de la búsqueda '#{term}'"
		else
			lista
		end
		render :action => 'lista'
	end

	def lista
    #		@experts, @page = Expert.paginate (:all, :page => params[:page], :per_page => 50)
		@experts = Expert.find :all, :order => 'name ASC'
	end
	
	def materias
		materia = Materia.find(params[:id])
		@experts = materia.experts
		@filter = "l@s expert@s en la materia '#{materia.name}'"
		render :action => 'lista'
	end

	def ver
		@expert = Expert.find(params[:id])
	end

	def nuevo
    @expert = Expert.new
    @expert.author = nil # current_user.login
    @expert.prepare
    @materias = Materia.find :all
	end

	def editar 
    @expert = Expert.find(params[:id])
    @materias = Materia.find :all
	end

	def update
		@expert = Expert.find(params[:id])
		@expert.attributes = params[:expert]
		parse_params(params, @expert)
		if @expert.save
			flash[:notice] = 'Se ha guardado con éxito'
			redirect_to :action => 'ver', :id => @expert
		else
			render :action => 'editar'
		end
    clear_cache(params[:id])
	end

	def create
		@expert = Expert.new(params[:expert])
		parse_params(params, @expert)
		if @expert.save
			flash[:notice] = 'Experta/o añadida/o a la base de datos'
			redirect_to :action => 'ver', :id => @expert
		else
			render :action => 'nuevo'
		end
    clear_cache(nil)
	end

	def destroy
    render :text => 'Borrar ha sido temporalmente deshabilitado. Reutiliza la ficha con otrx expertx o escribe a danigb@gmail.com para que la borre.'
		#expert = Expert.find(params[:id])
		#expert.destroy
		#redirect_to :action => 'lista'
	end

  private

  def clear_cache(id = nil)
    expire_page :action => 'lista'
    expire_page(:action => 'ver', :id => id) unless id.nil?
  end

	def parse_params(params, expert)
    expert.materias.clear
    params[:selected].split('m').each {|i| expert.materias << Materia.find(i) if i.length > 0}
    add_extra(params, expert)
	end

	def add_extra(params, expert)
		expert.extras.clear
    #		expert.extras.each {|e| e.destroy unless e.new_record? }
		params[:etype].each_with_index do |item, index| 
			extra = Extra.new(:etype => params[:etype][index],
				:value1  => params[:value1][index],
				:value2  => params[:value2][index],
				:value3  => params[:value3][index],
				:value4  => params[:value4][index])
			expert.extras << extra
		end
	end

end
