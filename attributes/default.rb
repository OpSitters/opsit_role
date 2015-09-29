# Base role
default['opsit']['base']['role'] = 'base'
default['opsit']['base']['cookbook'] = 'opsit_role'

# What is the default ip attribute for all nodes?
default['opsit']['host_attribute'] = 'opsit.internal_ip'

# Is nagios statsd/carbon? What env should we look in? What attrib is the server ip?
default['opsit']['services']['carbon']['enabled'] = false
default['opsit']['services']['carbon']['role'] = 'carbon'
default['opsit']['services']['carbon']['host_environment'] = nil
default['opsit']['services']['carbon']['host_attribute'] = 'opsit.internal_ip'
default['opsit']['services']['carbon']['client_attribute'] = 'opsit.internal_ip'
default['carbon']['client_attribute'] = node['opsit']['services']['carbon']['client_attribute']
default['carbon']['host_attribute'] = node['opsit']['services']['carbon']['host_attribute']
default['carbon']['host_environment'] = node['opsit']['services']['carbon']['host_environment']
default['carbon']['server_role'] = node['opsit']['services']['carbon']['role']

# Is munin available? What env should we look in? What attrib is the server ip?
default['opsit']['services']['munin']['enabled'] = false
default['opsit']['services']['munin']['role'] = 'munin'
default['opsit']['services']['munin']['host_environment'] = nil
default['opsit']['services']['munin']['host_attribute'] = 'opsit.internal_ip'
default['opsit']['services']['munin']['client_attribute'] = 'opsit.monitor_ip'
default['munin']['monitoring_attribute'] = node['opsit']['services']['munin']['client_attribute']
default['munin']['host_attribute'] = node['opsit']['services']['munin']['host_attribute']
default['munin']['host_environment'] = node['opsit']['services']['munin']['host_environment']
default['munin']['server_role'] = node['opsit']['services']['munin']['role']

# Is nagios available? What env should we look in? What attrib is the server ip?
default['opsit']['services']['nagios']['enabled'] = false
default['opsit']['services']['nagios']['role'] = 'nagios'
default['opsit']['services']['nagios']['host_environment'] = nil
default['opsit']['services']['nagios']['host_attribute'] = 'opsit.internal_ip'
default['opsit']['services']['nagios']['client_attribute'] = 'opsit.monitor_ip'
default['nagios']['monitoring_attribute'] = node['opsit']['services']['nagios']['client_attribute']
default['nagios']['host_attribute'] = node['opsit']['services']['nagios']['host_attribute']
default['nagios']['host_environment'] = node['opsit']['services']['nagios']['host_environment']
default['nagios']['server_role'] = node['opsit']['services']['nagios']['role']


# Is rsyslog available? What env should we look in? What attrib is the server ip?
default['opsit']['services']['rsyslog']['enabled'] = false
default['opsit']['services']['rsyslog']['role'] = 'logstash'
default['opsit']['services']['rsyslog']['host_environment'] = nil
default['opsit']['services']['rsyslog']['host_attribute'] = 'opsit.internal_ip'
default['opsit']['services']['rsyslog']['client_attribute'] = 'opsit.internal_ip'
default['rsyslog']['client_attribute'] = node['opsit']['services']['rsyslog']['client_attribute']
default['rsyslog']['host_attribute'] = node['opsit']['services']['rsyslog']['host_attribute']
default['rsyslog']['host_environment'] = node['opsit']['services']['rsyslog']['host_environment']
default['rsyslog']['server_role'] = node['opsit']['services']['rsyslog']['role']


# Do we want to register this node in route 53?
default['opsit']['route53']['registration'] = false
default['opsit']['route53']['zone_id'] = nil

# Delete the validation pem if found?
default['opsit']['chef']['delete_validation'] = true

# Remove some not needed packages if found?
default['opsit']['packages']['prune'] = true

# Install some tool packages, like vim, strace, etc
default['opsit']['packages']['tools'] = true

# Configure SSHD for two factor auth if available?
default['opsit']['sshd']['configure'] = true
default['opsit']['sshd']['port'] = "22"

