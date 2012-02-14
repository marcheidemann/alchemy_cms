module Alchemy
	# == Containers are element collections.
	# 
	# You can place containers like elements on a page or in a cell.
	# 
	# To manage containers create a +containers.yml+ file in +config/alchemy+.
	# 
	# === Example containers.yml file:
	# 
	#   # config/alchemy/containers.yml
	#   - name: image_slider
	#     elements: slide
	# 
	class Container < ActiveRecord::Base

		belongs_to :page, :class_name => 'Alchemy::Page'
		belongs_to :cell, :class_name => 'Alchemy::Cell'
		has_many :elements, :class_name => 'Alchemy::Element'

		acts_as_list :scope => [:page_id, :cell_id]

		validates :name, :presence => true

		def initialize(name = nil)
			super({:name => name})
		end

		# Gets containers definition from +config/alchemy/containers.yml+ as hash
		def definition
			self.class.definitions.detect { |d| d[:name] == self.name }
		end

		# Returns an array of all container definitions found in +config/alchemy/containers.yml+
		def self.definitions
			definitions = ::YAML.load_file(Rails.root.join('config/alchemy', 'containers.yml'))
			definitions.map(&:symbolize_keys)
		end

	end
end
