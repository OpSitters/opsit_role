name             'opsit_role'
maintainer       'OpSitters'
maintainer_email 'oss@opsitters.com'
version          '1.0.2'
license          'Apache 2.0'
description      'OpSitters base role'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

depends "opsit_libs"
depends "opsit_ops"

%w{
  chef-solo-search
  ntp
  ohai
  sudo
  users
}.each do |cb|
  depends cb
end

%w{ debian ubuntu centos redhat }.each do |os|
  supports os
end