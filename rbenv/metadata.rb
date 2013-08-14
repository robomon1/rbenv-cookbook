name             "rbenv"
maintainer       "Riot Games"
maintainer_email "jamie@vialstudios.com"
license          "Apache 2.0"
description      "Installs and configures rbenv"
version          "1.5.0"

recipe "rbenv::default", "Installs and configures rbenv"
recipe "rbenv::ruby_build", "Installs and configures ruby_build"
recipe "rbenv::ohai_plugin", "Installs an rbenv Ohai plugin to populate automatic_attrs about rbenv and ruby_build"
recipe "rbenv::rbenv_vars", "Installs an rbenv plugin rbenv-vars that lets you set global and project-specific environment variables before spawning Ruby processes"

%w{ centos redhat fedora ubuntu debian amazon oracle}.each do |os|
  supports os
end

%w{ git build-essential apt }.each do |cb|
  depends cb
end

depends 'ohai', '>= 1.1'

attribute "rbenv",
  :display_name => "rbenv Hash",
  :description => "Hash of rbenv attributes",
  :type => "hash"

#default[:rbenv][:user]          = "rbenv"
attribute "rbenv/user",
  :display_name => "rbenv user",
  :description => "User to run rbenv as",
  :default => 'root'
  
#default[:rbenv][:group]         = "rbenv"
attribute "rbenv/group",
  :display_name => "rbenv group",
  :description => "Group to run rbenv as",
  :default => 'root'
  
#default[:rbenv][:manage_home]   = true
attribute "rbenv/manage_home",
  :display_name => "Manage home for rbenv?",
  :description => "Should the rbenv home be managed",
  :default => 'true'

#default[:rbenv][:group_users]         = Array.new
attribute "rbenv/group_users",
  :display_name => "Unknown",
  :description => "Not sure what this property does.",
  :type => "hash"

#default[:rbenv][:git_repository]      = "git://github.com/sstephenson/rbenv.git"
attribute "rbenv/git_repository",
  :display_name => "rbenv git repository",
  :description => "Git repo for rbenv",
  :default => 'git://github.com/robomon1/rbenv-cookbook'

#default[:rbenv][:git_revision]        = "master"
attribute "rbenv/git_revision",
  :display_name => "rbenv git branch, tag, or commit",
  :description => "Git branch, tag, or commit for rbenv repo",
  :default => 'master'

#default[:rbenv][:install_prefix]      = "/opt"
attribute "rbenv/install_prefix",
  :display_name => "Installation dir prefix",
  :description => "Installation directory prefix",
  :default => '/opt'

#default[:ruby_build][:git_repository] = "git://github.com/sstephenson/ruby-build.git"
attribute "ruby_build/git_repository",
  :display_name => "ruby-build git repository",
  :description => "Git repo for ruby-build",
  :default => 'git://github.com/sstephenson/ruby-build.git'

#default[:ruby_build][:git_revision]   = "master"
attribute "ruby_build/git_revision",
  :display_name => "ruby_build git branch, tag, or commit",
  :description => "Git branch, tag, or commit for ruby_build repo",
  :default => 'master'

#default[:rbenv_vars][:git_repository] = "git://github.com/sstephenson/rbenv-vars.git"
attribute "rbenv_vars/git_repository",
  :display_name => "rbenv git repository",
  :description => "Git repo for rbenv-vars",
  :default => 'git://github.com/sstephenson/rbenv-vars.git'

#default[:rbenv_vars][:git_revision]   = "master"
attribute "rbenv_vars/git_revision",
  :display_name => "rbenv-vars git branch, tag, or commit",
  :description => "Git branch, tag, or commit for rbenv-vars repo",
  :default => 'master'
