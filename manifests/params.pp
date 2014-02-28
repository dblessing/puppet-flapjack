# == Class flapjack::params
#
# This class is meant to be called from flapjack
# It sets variables according to platform
#
class flapjack::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'flapjack'
      $service_name = 'flapjack'
    }
    'RedHat', 'Amazon': {
      $package_name = 'flapjack'
      $service_name = 'flapjack'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
