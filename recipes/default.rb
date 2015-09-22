# Author:: Salvatore Poliandro III (sal@opsitters.com)
# Cookbook Name:: opsit_role
# Recipe:: default
#
# Copyright 2015, OpSitters
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


include_recipe 'opsit_libs'
include_recipe 'opsit_ops'

# If there was a wrapper cookbook that set node['opsit']['base']['cookbook']
# try to load an environment recipe from that wrapper
if node['opsit']['base']['cookbook'] != cookbook_name
  begin
    include_recipe "#{node['opsit']['base']['cookbook']}::#{node.chef_environment}" do
      ignore_failure true
    end
  rescue
    opsit_warn("No Environment Settings loaded from #{node['opsit']['base']['cookbook']} for #{node.chef_environment}")
  end
else
  # Load a recipe from this cookbook for the current environment, if it exists.
  begin
    include_recipe "#{cookbook_name}::#{node.chef_environment}" do
      ignore_failure true
    end
  rescue
    opsit_debug("No Environment Settings loaded from #{cookbook_name} for #{node.chef_environment}")
  end
end


# This is needed for dev
if Chef::Config[:solo]
  include_recipe "chef-solo-search"
end

# These recipes are considered critical, they must run
critical_recipes = [
  'users::sysadmins',
  'sudo'
]

if node['opsit']['chef']['delete_validation'] == true
  critical_recipes << 'opsit_ops::delete_validation'
end

if node['opsit']['services']['carbon']['enabled'] == true
  node.set['carbon']['client_attribute'] = node['opsit']['services']['carbon']['client_attribute']
  node.set['carbon']['host_attribute'] = node['opsit']['services']['carbon']['host_attribute']
  node.set['carbon']['host_environment'] = node['opsit']['services']['carbon']['host_environment']
  node.set['carbon']['server_role'] = node['opsit']['services']['carbon']['role']
  if ! node.role?(node['opsit']['services']['carbon']['role'])
    critical_recipes << 'opsit_ops::carbon_client'
  end
end

if node['opsit']['services']['munin']['enabled'] == true
  node.set['munin']['monitoring_attribute'] = node['opsit']['services']['munin']['client_attribute']
  node.set['munin']['host_attribute'] = node['opsit']['services']['munin']['host_attribute']
  node.set['munin']['host_environment'] = node['opsit']['services']['munin']['host_environment']
  node.set['munin']['server_role'] = node['opsit']['services']['munin']['role']
  if ! node.role?(node['opsit']['services']['munin']['role'])
    critical_recipes << 'opsit_ops::munin_client'
  end
end

if node['opsit']['services']['nagios']['enabled'] == true
  node.set['nagios']['monitoring_attribute'] = node['opsit']['services']['nagios']['client_attribute']
  node.set['nagios']['host_attribute'] = node['opsit']['services']['nagios']['host_attribute']
  node.set['nagios']['host_environment'] = node['opsit']['services']['nagios']['host_environment']
  node.set['nagios']['server_role'] = node['opsit']['services']['nagios']['role']
  if ! node.role?(node['opsit']['services']['nagios']['role'])
    critical_recipes << 'opsit_ops::nrpe'
  end
end

if node['opsit']['services']['rsyslog']['enabled'] == true
  node.set['rsyslog']['client_attribute'] = node['opsit']['services']['rsyslog']['client_attribute']
  node.set['rsyslog']['host_attribute'] = node['opsit']['services']['rsyslog']['host_attribute']
  node.set['rsyslog']['host_environment'] = node['opsit']['services']['rsyslog']['host_environment']
  node.set['rsyslog']['server_role'] = node['opsit']['services']['rsyslog']['role']
  if ! node.role?(node['opsit']['services']['rsyslog']['role'])
    critical_recipes << 'opsit_ops::rsyslog'
  end
end

if node['opsit']['sshd']['configure'] == true
  critical_recipes << 'opsit_ops::sshd'
end

#Run critical recipes
critical_recipes.each do | recipe |
  include_recipe recipe
end

# These recipes are non-critical, its ok if they dont run or dont exist
non_critical_recipes = [
  'ntp'
]

if node['opsit']['packages']['prune'] == true
  non_critical_recipes << 'opsit_ops::package_prune'
end

if node['opsit']['packages']['tools'] == true
  non_critical_recipes << 'opsit_ops::package_tools'
end

non_critical_recipes.each do | recipe |
  include_recipe recipe do
    ignore_failure true
  end
end

if node.run_list.include?(node['opsit']['base']['role'])
  include_recipe "opsit_ops::attributes"
end
