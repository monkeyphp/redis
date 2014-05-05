#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


case node["platform"]
    
when "debian", "ubuntu"
    package "redis-server" do
        action :install
    end

    service "redis-server" do
        supports :start => true, :stop => true, :status => true, :restart => true
        action :nothing
    end
    
    template "/etc/redis/redis.conf" do 
        source   "redis.conf.erb"
        owner    "root"
        group    "root"
        mode     0644
        notifies :reload, resources(:service => "redis-server")
    end

when "redhat", "centos", "fedora"
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

end






