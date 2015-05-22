# Cookbook Name:: icaclient
# Recipe:: default
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

deb_file = 'icaclient_13.1.0.285639_amd64.deb'

execute 'add-architecture' do
  command 'dpkg --add-architecture i386'
  not_if 'dpkg -l icaclient'
end

execute 'update-apt-cache' do
  command 'apt-get -y -q update'
  not_if 'dpkg -l icaclient'
end

install_deps = %W(
  libxerces-c3.1
  libwebkitgtk-1.0-0
  libc6:i386
  libstdc++6:i386
  libgtk2.0-0:i386
  libxext6:i386
  libxmu6:i386
  libxpm4:i386
  libasound2:i386
  libx11-6:i386
  libice6:i386
  libsm6:i386
  libspeex1:i386
  libvorbis0a:i386
  libvorbisenc2:i386
  libcanberra-gtk-module:i386
)

install_deps.each do |pkg|
  package pkg
end

cookbook_file "/tmp/#{deb_file}" do
  source "#{deb_file}"
  owner  'root'
  group  'root'
  mode   '0644'
end

execute 'install-icaclient' do
  command "dpkg -i /tmp/#{deb_file}"
  not_if 'dpkg -l icaclient'
  notifies :run, "execute[add-certificates]", :immediately
end

execute 'add-certificates' do
  command 'ln -s /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts/'
  not_if { ::File.exists?('/opt/Citrix/ICAClient/keystore/cacerts/NetLock_Business_=Class_B=_Root.crt') }
  notifies :run, "execute[rehash-keystore]", :immediately
  action :nothing
end

execute 'rehash-keystore' do
  command 'c_rehash /opt/Citrix/ICAClient/keystore/cacerts/'
  action :nothing
end

file '/usr/lib/mozilla/plugins/npwrapper.npica.so' do
  action :delete
end

file '/usr/lib/firefox/plugins/npwrapper.npica.so' do
  action :delete
end

file '/usr/lib/mozilla/plugins/npica.so' do
  action :delete
end

link '/usr/lib/mozilla/plugins/npica.so' do
  to '/opt/Citrix/ICAClient/npica.so'
  link_type :symbolic
end
