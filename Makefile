VAGRANT=$(shell which vagrant)
RSPEC=$(shell which rspec)

install:
	$(VAGRANT) up
destroy:
	$(VAGRANT) destroy
test:
	$(RSPEC) spec/treasure2013_spec.rb
	
