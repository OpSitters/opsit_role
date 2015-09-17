opsit_role Cookbook
================

Base Server role, will include the environment of the server as part of the base role. It does this by loading a recipe named after the node environment from this cookbook, if it exists. The git ignore is setup to not include any recipes other than default so if you fork this book you might want to change your .gitignore file.


Requirements
============
- opsit_ops cookbook
- opsit_libs cookbook
- chef-solo-search cookbook
- ntp cookbook
- ohai cookbook
- sudo cookbook
- users cookbook


Attributes
==========
###Base role
````ruby
default['opsit']['base']['role'] = 'base'
default['opsit']['base']['cookbook'] = 'opsit_role'
````

###Is there a statsd/carbon install for this env?
````ruby
default['opsit']['services']['carbon']['enabled'] = false
default['opsit']['services']['carbon']['role'] = 'carbon'
````

###Is there a munin install for this env?
```ruby
default['opsit']['services']['munin']['enabled'] = false
default['opsit']['services']['munin']['role'] = 'munin'
```

###Is there a nagios install for this env?
```ruby
default['opsit']['services']['nagios']['enabled'] = false
default['opsit']['services']['nagios']['role'] = 'nagios'
```

###Is there a rsyslog install for this env?
```ruby
default['opsit']['services']['rsyslog']['enabled'] = false
default['opsit']['services']['rsyslog']['role'] = 'logstash'
```

###Do we want to register this node in route 53?
```ruby
default['opsit']['route53']['registration'] = false
default['opsit']['route53']['zone_id'] = nil
```

###Delete the validation pem if found?
```ruby
default['opsit']['chef']['delete_validation'] = true
```

###Remove some not needed packages if found?
```ruby
default['opsit']['packages']['prune'] = true
```

###Install some tool packages, like vim, strace, etc
```ruby
default['opsit']['packages']['tools'] = true
```

###Configure SSHD for two factor auth if available?
```ruby
default['opsit']['sshd']['configure'] = true
default['opsit']['sshd']['port'] = "22"
```

Usage
=====
include role_base in a node's run list, check the releases page for production ready versions.


Contributing
==============
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github


Authors
=======
- Original Author: Salvatore Poliandro III <sal@opsitters.com>
- Author: JP Dentone <jp@opsitters.com>
- Author: Wayne Egerer <wayne@opsitters.com>
