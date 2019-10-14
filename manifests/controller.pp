# @summary Setup Bolt controller
#
# Configure a node to be able to run Puppet Bolt and run commands or
# tasks on target hosts via SSH. This class does not setup any system
# users.
#
# @example
#   include ssh_sudoers::controller
#
class ssh_sudoers::controller
(
  String           $user,
  Optional[String] $ssh_private_key_content = undef,
  Optional[String] $ssh_private_key_source = undef,
)
{

  # The root user requires special treatment
  $ssh_dir = $user ? {
    'root'  => '/root/.ssh',
    default => "/home/${user}/.ssh"
  }

  file { "${ssh_dir}/puppet-ssh_sudoers":
    ensure  => 'present',
    content => $ssh_private_key_content,
    source  => $ssh_private_key_source,
    owner   => $user,
    group   => $user,
    mode    => '0600',
  }
}
