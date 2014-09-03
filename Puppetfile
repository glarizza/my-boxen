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

github "boxen", "3.6.2"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "onepassword",    "1.1.0"
github "sublime_text_2", "1.1.2"
github "gitx",           "1.2.0"
github "caffeine",       "0.0.1"
github "iterm2",         "1.0.4"
github "osx",            "2.2.1"
github "dropbox",        "1.2.0"
github "sizeup",         "1.0.0"
github "chrome",         "1.1.2"
github "vagrant",        "3.0.1"
github "handbrake",      "1.0.1"
github "vmware_fusion",  "1.1.0"
github "hipchat",        "1.1.0"
github "spotify",        "1.0.2"
github "colloquy",       "1.0.0"
github 'github_for_mac', '1.0.2'
github 'packer', '0.6.0'
github "property_list_key",  :repo => "glarizza/puppet-property_list_key"
mod "vcsrepo",            "0.1.0",   :github_tarball => "puppetlabs/puppetlabs-vcsrepo"



github "dnsmasq",     "1.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.1.1"
github "git",         "2.5.0"
github "go",          "1.1.0"
github "homebrew",    "1.9.4"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.3"
github "nodejs",      "3.8.1"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.2"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
