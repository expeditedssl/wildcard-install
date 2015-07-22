# wildcard-install
Install a single ExpeditedSSL Wildcard cert onto multiple different app-instances on the Heroku EU zone.

## Who should use this?
Due to differences in how the the EU vs US Heroku SSL Endpoints are provisioned, the EU setup to install one wildcard
SSL certificate onto multiple different app-instances can be onerous. If you are dealing with this, please keep reading.

## Prerequisites
To use this script you'll need to place the following three files into the same folder as the `wildcard-installer.rb` script.

1. `instances.txt` - add each app-instance on a different line of the file (see example)
2. `server.crt` - the cert and any intermediate certs you need.
3. `server.key` - the private key for the cert

The cert and key can be obtained by emailing support@expeditedssl.com. 

## Usage
Once you have the script, the instances, the cert and the key in the same directory, run the script:

`ruby wildcard-installer.rb` 

The script will attempt the following two actions on each app-instance in the `instances.txt` file:

1. Provision the Heroku SSL Endpoint add-on
2. Install the certificate to the SSL Endpoint

The script should detect if all of the files are present and give you continuing output as it installs the cert onto each app-instance.

Any issues, concerns or errors you have, please contact: support@expeditedssl.com



