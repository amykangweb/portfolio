# -*- encoding: utf-8 -*-
# stub: eefgilm 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "eefgilm"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Erik Nilsen", "Marco Lindsay"]
  s.date = "2015-08-27"
  s.description = "Eefgilm helps keep your gemfile in order. It will alphabetize your gems, remove comments, and remove unnecessary whitespace."
  s.email = ["enilsen16@live.com", "lindsay_marco@hotmail.com"]
  s.executables = ["eefgilm"]
  s.files = ["bin/eefgilm"]
  s.homepage = "http://enilsen16.github.io/Eefgilm/"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "A gem to keep your Gemfile in best practice."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
