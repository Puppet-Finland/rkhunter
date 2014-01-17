#
# == Class: rkhunter::install
#
# Installs rkhunter package
#
class rkhunter::install {

    include rkhunter::params

    package { 'rkhunter':
        name => "${::rkhunter::params::package_name}",
        ensure => installed,
    }
}
