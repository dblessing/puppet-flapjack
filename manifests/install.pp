# == Class flapjack::intall
#
class flapjack::install {
  $ensure   = $flapjack::ensure

  package { $flapjack::package_name:
    ensure    => $ensure,
  }

  if $flapack::install_gem == true {
    package { $flapjack::gem_name:
      ensure    => $ensure,
      provider  => 'gem',
    }
  }
}