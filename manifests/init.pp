# == Class: deployment
#
# Full description of class deployment here.
class deployment (
  $deployment_server_key_type = "dsa",
  $deployment_server_pub_key = "AAAAB3NzaC1kc3MAAACBAP65rgG1Oxv3i58E+Z5rIwouG3jtq1l6vwDHfirdvZP2MmMw/GDQLaae/PsnQeJincbHHJR4SX6m25+fmVA0dgkOLwgaOVdpS2fHNOTPyndnbcS/q4zXSqMlqddN4G1cNKV8mDxfMXYcYyjn6JYUNjAaZ67fLai0Lh5NH11zmz4LAAAAFQDbKW+o5i41WjxxHQQP1BTpbMrv0wAAAIBrWcSmW3468E5njmAHxc/X1n9EVdBP/K8zw90yC+Vhb5bKdSIQV75Z643BuwGNmnM7SpXF0u7ujz4dph3B2tidI96G0FWkAFEYEvbIN9XDsyDbqWVdOq82t+KtlHQVyhDKBgShq6vGlDa1NqID4PC0G3VmCg/tE2ZsJF5yQxslLwAAAIBGmFosxAloFO57Qb2ZNl9RHaGhxBUmpkiCn+sn4/WSEIcQYHvuyVzkMjNHe3DeyZ+LVJdZ8xF4lsPH9m3q49krN1p3dDmCB2DXHGyxVflCDZpNFrtrMuN4tK+yEvVkgGL360u6huUjcrdegUWn+3MPTMxqP4J/lVb2VXvNyUsPHg==",
){

  include sudo
  include common::deploy_dir

  ssh_authorized_key{ 'inxx34_root':
    type => 'dsa',
    user => 'deployuser',
    key  => $deployment_server_pub_key,
  }

  sudo::conf { 'sudo_deployuser':
    content => "Defaults:deployuser !requiretty\ndeployuser ALL=(ALL) NOPASSWD: /x01/deploy/*.run *, /sbin/service",
  }

  # Create the deployuser from the users information
  #$allusers=hiera(users)
  #$deployuser=local_users(['deployuser'],$allusers)
  #  create_resources("common::mkuser",$deployuser)
}
