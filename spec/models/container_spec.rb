require 'spec_helper'

describe Alchemy::Container do

	it "should return all container definitions" do
		Alchemy::Container.definitions.should == [{:name => 'image_slider', :elements => ['slide']}]
	end

	it "should be instanciable from string" do
	  Alchemy::Container.new('image_slider').should be_instance_of(Alchemy::Container)
	end

	it "should return its definition as symbolized hash" do
		Alchemy::Container.new('image_slider').definition.should == {:name => 'image_slider', :elements => ['slide']}
	end

end
