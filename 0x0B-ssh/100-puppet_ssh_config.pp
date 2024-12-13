# Ensure the SSH client configuration directory exists
file { '/root/.ssh':
  ensure => directory,
  mode   => '0700',
  owner  => 'root',
  group  => 'root',
}

# Create or update the SSH client configuration file
file { '/root/.ssh/config':
  ensure  => file,
  mode    => '0600',
  owner   => 'root',
  group   => 'root',
  content => template('ssh/config.erb'),
}

# Define the lines to add to the configuration file
file_line { 'Declare identity file':
  path  => '/root/.ssh/config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/root/.ssh/config',
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
}
