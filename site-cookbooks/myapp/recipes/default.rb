#
# Cookbook Name:: myapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "database::mysql"

# Store this in a variable so we don't keep repeating it
mysql_connection_info = {
    :host => "localhost",
    :username => 'root',
    # automatically get this from the override_attributes call!
    :password => node['mysql']['server_root_password']
}

# my_database = database name
mysql_database 'my_database' do
  connection mysql_connection_info
  action :create
end


