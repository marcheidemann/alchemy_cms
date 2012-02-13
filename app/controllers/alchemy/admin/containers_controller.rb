module Alchemy
	module Admin

		class ContainersController < Alchemy::Admin::BaseController

			def new
				@container = Container.new
				@containers = Page.find(params[:page_id]).available_container_definitions
				render :layout => false
			end

		end

	end
end
