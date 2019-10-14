# @summary setup a SSH target node
#
# configure ssh and optionally sudo rules on a target node
#
# @example
#   include ssh_sudoers::target
#
class ssh_sudoers::target
(
  String $user,
  String $sudo_fragment_prefix,
  String $ssh_public_key,
  String $ssh_public_key_type,
  String $admingroup,
  String $script_basedir,
  String $sudoersd,
)
{
  ssh_authorized_key { 'puppet-sshd_sudoers.pub':
    ensure => 'present',
    user   => $user,
    type   => $ssh_public_key_type,
    key    => $ssh_public_key,
  }
}
