# == Class flapjack::intall
#
class flapjack::install {
  $ensure   = $flapjack::ensure

  package { $flapjack::package_name:
    ensure    => $ensure,
    provider  => $flapjack::package_provider,
  }

  if $flapjack::install_api_gem == true {
    package { $flapjack::api_gem_name:
      ensure    => $ensure,
      provider  => 'gem',
    }
  }
}
