#
# == Class: rkhunter::cron
#
# Configure rkhunter to run from cron, first updating the catalogs and then 
# doing the actual checks.
#
# == Parameters
#
# [*manage*]
#   Manage rkhunter cronjob with Puppet. Valid values are 'yes' (default) and 
#   'no'.
# [*ensure*]
#   Status of the cronjob. Valid values 'present' and 'absent'. Defaults to 
#   'present'.
# [*hour*]
#   Hour(s) when rkhunter gets run. Defaults to 8 (8 AM).
# [*minute*]
#   Minute(s) when the rkhunter gets run. Defaults to 20.
# [*weekday*]
#   Weekday(s) when the rkhunter gets run. Defaults to * (all weekdays).
# [*email*]
#   Email address where notifications are sent. Defaults to top-scope variable 
#   $::servermonitor.
#
# == Examples
#
#   class { 'rkhunter::cron':
#       hour => '3',
#       minute => '35'
#       weekday => '1-5',
#   }
#
class rkhunter::cron
(
    $manage = 'yes',
    $ensure = 'present',
    $hour = '7',
    $minute = '00',
    $weekday = '*',
    $email = $::servermonitor
)
{

if $manage == 'yes' {

    include ::rkhunter

    $cron_command = 'rkhunter --update --nocolors > /dev/null && rkhunter --cronjob'

    cron { 'rkhunter-cron':
        ensure      => $ensure,
        command     => $cron_command,
        user        => root,
        hour        => $hour,
        minute      => $minute,
        weekday     => $weekday,
        environment => [ 'PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin', "MAILTO=${email}" ],
    }
}
}
