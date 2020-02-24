# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Cookbook Name:: fb_etc_profiled
# Recipe:: default
#
# Copyright (c) 2019-present, Facebook, Inc.
# All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

unless node.linux? || node.macos?
  fail 'fb_etc_profiled: this cookbook only supports Linux and MacOS!'
end

cookbook_file '/etc/profile' do
  only_if { node['fb_etc_profiled']['manage'] }
  not_if { node.linux? }
  source 'profile'
  owner node.root_user
  group node.root_group
  mode '0644'
end

directory '/etc/profile.d' do
  only_if { node['fb_etc_profiled']['manage'] }
  owner node.root_user
  group node.root_group
  mode '0755'
end

fb_etc_profiled 'Setting up /etc/profile.d' do
  only_if { node['fb_etc_profiled']['manage'] }
end
