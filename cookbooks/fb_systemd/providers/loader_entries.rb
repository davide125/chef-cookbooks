# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.
#

use_inline_resources

def whyrun_supported?
  true
end

action :run do
  path = node['fb_systemd']['boot']['path']
  entries = node['fb_systemd']['boot']['loader']['entries'].to_hash

  Dir.glob("#{path}/loader/entries/fb_systemd_*.conf").each do |path|
    
  end

  entries.each do |entry, _conf|
    template "#{path}/loader/entries/fb_systemd_#{entry}.conf" do
      source 'loader-entry.conf.erb'
      owner 'root'
      group 'root'
      mode '0644'
      variables(
        :entry => entry,
      )
    end
  end
end
