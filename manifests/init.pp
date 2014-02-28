# == Class: flapjack
#
# This class manages flapjack. If you intend to use the gem
# provider (which is default) or flapjack types to manage 
# entities/contacts/etc you must be running Puppet 
# with Ruby 1.9.3 or higher. Sorry, CentOS/RedHat 6 users. You 
# need to use something like puppet-omnibus to bring yourself 
# up to Ruby 1.9.3+. 
#
# Use yum or apt provider to install via package instead of gem
# based on preference or to avoid the Ruby 1.9.3+ requirement.
#
# === Parameters
#
# [*ensure*]
#   The ensure value for all resources in this module. Defaults to
#   present.
#
# [*package_name*]
#   The name of the flapjack package. Defaults to 'flapjack' for 
#   all distros.
#
# [*package_provider]
#   The provider to use to install flapjack. Defaults to 'gem'. 
#
# [*install_api_gem*]
#   A boolean toggle to specify whether the flapjack-diner gem should
#   be installed. This is primarily for Ruby 1.8.7 users who do not 
#   wish to use the built-in types/providers (since the flapjack-diner
#   gem only works with Ruby 1.9.3+). Defaults to true.
#
# [*api_gem_name*]
#   The name of the flapjack-diner gem. Defaults to 'flapjack-diner'.
#   *install_api_gem* parameter must be set to true for the gem to be installed.
#
class flapjack (
  $ensure             = present,
  $package_name       = $flapjack::params::package_name,
  $package_provider   = 'gem',
  $install_api_gem    = true,
  $api_gem_name       = 'flapjack-diner',
) inherits flapjack::params {

  validate_string($package_name, $api_gem_name)
  validate_bool($install_api_gem)

  class { 'flapjack::install': } ->
  class { 'flapjack::config': } ~>
  class { 'flapjack::service': } ->
  Class['flapjack']
}
