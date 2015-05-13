#
# == Class: rkhunter
#
# Install a tool for checking if any of the running processes are using files 
# from packages that have been upgraded.
#
# Use rkhunter::cron to automate the checks and for emailing the results.
#
# == Parameters
#
# [*manage*]
#   Manage rkhunter with Puppet. Valid values are 'yes' (default) and 'no'.
# [*ensure*]
#   Ensure that rkhunter is 'present' (default) or 'absent'.
#
# == Examples
#
#   include rkhunter
#
# == Authors
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class rkhunter
(
    $manage = 'yes',
    $ensure = 'present'
)
{

if $manage == 'yes' {

    class { '::rkhunter::install':
        ensure => $ensure,
    }
}
}
