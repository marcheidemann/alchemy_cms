module Alchemy
	module Admin

		class ContainersController < Alchemy::Admin::BaseController

			def new
				@container = Container.new
				@containers = Page.find(params[:page_id]).available_container_definitions
				render :layout => false
			end

			def create
				@container = Container.new(params[:container][:name])
				if @container.save
					render :action => :create
				else
					render_remote_errors(@container, 'form#new_alchemy_container button.button')
				end
			end

		end

	end
end
