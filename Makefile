# Attach app to heroku server
init:
	heroku create

# Set environment variables so that gemfiles for ruby are installed locally to root directory of a2
# and then install the gems
gen_gems:
	export GEM_HOME=$HOME/.gemsexport PATH=.bundle/bin:$GEM_HOME/bin:$PATH
	bundle install

# Push updates to heroku server and check for SSL error
update:
	ifeq(fatal, $(findstring fatal, $(shell bash -c 'git push heroku master')))
		export GIT SSL_NO_VERIFY=1 && \
		git push heroku master
	else
		git push heroku master
	endif

# Add a remote git push URL
# add_git_url:
#	url = $(shell bash -c 'git remote show heroku | grep -e "Push" | cut -c 14-') && \
#	git remote set-url --add --push heroku [git_url] && \
#	git remote set-url --add --push $(url)

# View heroku app
view:
	heroku open

# View postgreSQL database
db_view:
	export PGPASSWORD=thecmpt276Passw0rd
	@echo "The password is: thecmpt276Passw0rd"
	@echo
	@echo "In the prompt for postgreSQL:"
	@echo"======================================="
	@echo "\l checks the databases"
	@echo "\dt checks the tables currently stored in the db cmpt276"
	@echo "\q quits the prompt"
	psql -h localhost -d cmpt276 -U cmpt276 -c '\l'

# Migrate database
db_migrate:
	rake db:migrate

# Setup databases for local development
db_create:
	export PGPASSWORD=thecmpt276Passw0rd
	bundle exec rake db:create
	@echo
	@echo "Change database in development to database: template1"
	name = $(shell bash -c 'read -p "Enter name for databases: ", varin; echo $$varin')
	psql -h localhost -d cmpt276 -U cmpt276 -c 'create database $(name)'
	psql -h localhost -d cmpt276 -U cmpt276 -c 'create database $(name)_development'
	psql -h localhost -d cmpt276 -U cmpt276 -c 'create database $(name)_test'

# Start rails server
start_rails:
	@echo "The application (not in production) will be running at the URL: localhost:5000"
	@echo
	heroku local web

# Test rails server (This may need single line syntax, but we will see)
test_rails:
	rake db:migrate RAILS_ENV=test
	rake test
