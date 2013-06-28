VAGRANT=$(shell which vagrant)
RSPEC=$(shell which rspec)

install:
	$(VAGRANT) up
destroy:
	$(VAGRANT) destroy
rspec:
	$(RSPEC) spec/treasure2013_spec.rb
	
