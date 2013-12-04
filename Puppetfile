# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.3.4"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "foreman",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "go",         "1.0.0"
github "homebrew",   "1.5.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "openssl",    "1.0.0"
github "pkgconfig",  "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.7.2"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "onepassword",    "0.0.1"
github "sublime_text_2", "0.0.1"
github "gitx",           "1.2.0"
github "caffeine",       "0.0.1"
github "imagemagick",    "0.0.1"
github "iterm2",         "0.0.1"
github "macvim",         "0.0.1"
github "xquartz",        "0.0.1"
github "osx",            "1.3.1"
github "dropbox",        "0.0.2"
github "sizeup",         "0.0.1"
github "chrome",         "0.0.2"
github "vagrant",        "2.0.7"
github "xquartz",        "1.1.0"
github "handbrake",      "0.0.1"
mod "property_list_key",  "0.1.0",   :github_tarball => "glarizza/puppet-property_list_key"
mod "vcsrepo",            "0.1.0",   :github_tarball => "puppetlabs/puppetlabs-vcsrepo"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
