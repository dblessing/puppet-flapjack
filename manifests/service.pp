# == Class flapjack::service
#
# This class is meant to be called from flapjack
# It ensure the service is running
#
class flapjack::service {
  include flapjack::params

  service { $flapjack::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
