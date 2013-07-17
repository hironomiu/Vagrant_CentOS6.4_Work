VAGRANT=$(shell which vagrant)
RSPEC=$(shell which rspec)

install:
	$(VAGRANT) up
destroy:
	$(VAGRANT) destroy
add-demouser:
	$(VAGRANT) ssh -c 'cd /tmp/vagrant-puppet/manifests && sudo puppet apply --modulepath="/vagrant/puppet/modules" --execute "include httpd-demouser" init.pp --detailed-exitcodes'
drop-db-user-vagrant:
	$(VAGRANT) ssh -c 'cd /vagrant/puppet/modules/db-vagrant/manifests && sudo puppet apply --modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/db-vagrant/templates" --execute "include db-vagrant"'
test:
	$(RSPEC) spec/treasure2013_spec.rb
	
