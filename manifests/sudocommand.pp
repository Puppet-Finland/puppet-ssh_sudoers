# @summary enable user to run a command with elevated privileges
#
# Add sudo wrapper script and matching sudo rule
#
# @example
#   ssh_sudoers::sudocommand { 'namevar': }
define ssh_sudoers::sudocommand
(
  String $script_content,
  String $admingroup = $::ssh_sudoers::target::admingroup,
  Enum['present','absent'] $ensure = 'present',
  String $script_basedir = $::ssh_sudoers::target::script_basedir,
  String $sudoersd = $::ssh_sudoers::target::sudoersd,
  String $sudo_fragment_prefix = $::ssh_sudoers::target::sudo_fragment_prefix,
  String $user = $::ssh_sudoers::target::user,
)
{

  # Add wrapper script
  $script = "${script_basedir}/${title}"

  file { $script:
    ensure  => $ensure,
    content => $script_content,
    owner   => 'root',
    group   => $admingroup,
    mode    => '0755',
    require => Class['::ssh_sudoers::target'],
  }

  # Add sudoers.d fragment
  file { "${sudoersd}/${sudo_fragment_prefix}-${title}":
    ensure  => $ensure,
    content => "${user} ALL=(ALL) NOPASSWD:${script}\n",
    owner   => 'root',
    group   => $admingroup,
    mode    => '0640',
    require => Class['::ssh_sudoers::target'],
  }
}
