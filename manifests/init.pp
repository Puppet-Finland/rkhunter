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
    $ensure = 'present'
)
{

# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_rkhunter', 'true') != 'false' {

    class { 'rkhunter::install':
        ensure => $ensure,
    }
}
}
