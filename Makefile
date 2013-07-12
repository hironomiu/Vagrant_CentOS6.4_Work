VAGRANT=$(shell which vagrant)
RSPEC=$(shell which rspec)

install:
	$(VAGRANT) up
destroy:
	$(VAGRANT) destroy
add-demouser:
	$(VAGRANT) ssh -c 'cd /tmp/vagrant-puppet/manifests && sudo puppet apply --modulepath="/vagrant/puppet/modules" --execute "include other" init.pp --detailed-exitcodes'
test:
	$(RSPEC) spec/treasure2013_spec.rb
	
