class { '::pulp::repo::upstream': }
-> class { '::pulp::consumer':
  host => "pulp.${domain}",
}
#pulp_register { "pulp.${domain}":
#  user     => 'admin'
#  password => 'admin',
#}
