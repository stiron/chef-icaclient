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

default['icaclient']['deb_file'] = 'icaclient_13.1.0.285639_amd64.deb'
default['icaclient']['install_deps'] = %W(
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
