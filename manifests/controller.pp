# @summary Setup a SSH controller
#
# Configure a node so that is able to run Puppet Bolt, Ansible, Fabric or
# similar on target hosts via SSH. This class does not setup any system users.
#
# @param user
#   The user for whom to install the private key
# @param ssh_private_key_content
#   Contents of the private key (e.g. string in eyaml). Mutually exclusive with
#   ssh_private_key_source.
# @param ssh_private_key_source
#   Source of the private key. Mutually exclusive with ssh_private_key_content. 
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
