#
# == Class: rkhunter::install
#
# Installs rkhunter package
#
class rkhunter::install
(
    $ensure
)
{
    include ::rkhunter::params

    package { 'rkhunter':
        ensure => $ensure,
        name   => $::rkhunter::params::package_name,
    }
}
