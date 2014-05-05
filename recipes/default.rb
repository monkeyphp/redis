#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "redis" do
    action :install
end

service "redis" do
    supports :start => true, :stop => true, :status => true, :restart => true, :condrestart => true
    action :nothing
end

template "/etc/redis.conf" do 
    source   "redis.conf.erb"
    owner    "root"
    group    "root"
    mode     0644
    notifies :reload, resources(:service => "redis")
end
