# Cookbook Name:: icaclient
# Recipe:: cleanup
#
# Copyright 2015 Tamas Molnar
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

deb_file = node['icaclient']['deb_file']

file "/tmp/#{deb_file}" do
  action :delete
end

execute 'cleanup-apt-cache' do
  command 'apt-get -y -q clean'
end
