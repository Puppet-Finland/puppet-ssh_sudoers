# @summary configure SSH access and sudo
#
# configure ssh and optionally sudo rules on a target node
#
# @example
#   include ssh_sudoers::target
#
class ssh_sudoers::target
(
  String $user,
  String $script_basedir,
  String $sudoersd,
  String $sudo_fragment_prefix,
  String $ssh_public_key,
  String $ssh_public_key_type
)
{
  ssh_authorized_key { 'puppet-ssh_sudoers.pub':
    ensure => 'present',
    user   => $user,
    type   => $ssh_public_key_type,
    key    => $ssh_public_key,
  }
}
