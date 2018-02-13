include ::epel
include ::pulp::repo::upstream
class { '::pulp':
  enable_docker     => false,
  enable_ostree     => false,
  enable_puppet     => false,
  enable_python     => false,
  enable_rpm        => true,
  #enable_deb        => true,
  enable_admin      => true,
  ssl_protocol      => ['all', '-SSLv3', '-TLSv1', '-TLSv1.1'],
  require           => Class['epel', 'pulp::repo::upstream'],
}
