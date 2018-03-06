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