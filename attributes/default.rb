# Base role
default['opsit']['base']['role'] = 'base'
default['opsit']['base']['cookbook'] = 'opsit_role'

# Is nagios statsd/carbon? What env should we look in? What attrib is the server ip?
default['opsit']['services']['carbon']['enabled'] = false
default['opsit']['services']['carbon']['role'] = 'carbon'
default['opsit']['services']['carbon']['host_environment'] = nil
default['opsit']['services']['carbon']['host_attribute'] = 'opsit.internal_ip'
default['opsit']['services']['carbon']['client_attribute'] = 'opsit.internal_ip'

# Is munin available? What env should we look in? What attrib is the server ip?
default['opsit']['services']['munin']['enabled'] = false
default['opsit']['services']['munin']['role'] = 'munin'
default['opsit']['services']['munin']['host_environment'] = nil
default['opsit']['services']['munin']['host_attribute'] = 'opsit.internal_ip'
default['opsit']['services']['munin']['client_attribute'] = 'opsit.monitor_ip'

# Is nagios available? What env should we look in? What attrib is the server ip?
default['opsit']['services']['nagios']['enabled'] = false
default['opsit']['services']['nagios']['role'] = 'nagios'
default['opsit']['services']['nagios']['host_environment'] = nil
default['opsit']['services']['nagios']['host_attribute'] = 'opsit.internal_ip'
default['opsit']['services']['nagios']['client_attribute'] = 'opsit.monitor_ip'

# Is rsyslog available? What env should we look in? What attrib is the server ip?
default['opsit']['services']['rsyslog']['enabled'] = false
default['opsit']['services']['rsyslog']['role'] = 'logstash'
default['opsit']['services']['rsyslog']['host_environment'] = nil
default['opsit']['services']['rsyslog']['host_attribute'] = 'opsit.internal_ip'
default['opsit']['services']['rsyslog']['client_attribute'] = 'opsit.internal_ip'

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

