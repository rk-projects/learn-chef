package 'apache' do
  package_name 'httpd'
  action :install
end

service 'httpd' do
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  owner 'root'
  group 'apache'
  mode '0755'
  action :create
end

file '/etc/motd' do
  content 'Welcome to My Server'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'command-test' do
  command 'echo blah >> /etc/motd'
  action :run
  only_if 'test -r /etc/issue'
  not_if 'test -r /etc/motd'
end

