
# Checking for prerequisites
clear_to_install = false

# - App Instances File
if File.exists?('instances.txt')
	instances_file = File.open('instances.txt', 'r')
	instance_file_exists = true
else
	puts "\t Cert installation stopped as app instance file 'instances.txt' not found."
end

# - Cert File
if File.exists?('server.crt')
	crt_file_exists = true
else
	puts "\t Cert installation stopped as cert file 'server.crt' not found."
end

# - Key File
if File.exists?('server.key')
	key_file_exists = true
else
	puts "\t Cert installation stopped as key file 'server.key' not found."
end

# - Heroku CLI
if `heroku`.include?('Usage: heroku')
	heroku_cli_exists = true
else
	puts "\t Heroku CLI was not found - it should be installed and path accessible."
end

if instance_file_exists && crt_file_exists && key_file_exists && heroku_cli_exists

	instances_file.each_line do |line|

		puts "Adding Heroku SSL Endpoint to #{line}"
		command = "heroku addons:create ssl:endpoint -a #{line.strip}"
		system("bash", "-c", command)

		puts "Pushing cert to SSL Endpoint"
		command = "heroku certs:add server.crt server.key -a #{line.strip}"
		system("bash", "-c", command)
		
	end

end



