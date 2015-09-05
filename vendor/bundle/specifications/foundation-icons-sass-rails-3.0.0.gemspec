# -*- encoding: utf-8 -*-
# stub: foundation-icons-sass-rails 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "foundation-icons-sass-rails"
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Zaiste!"]
  s.date = "2013-08-26"
  s.description = "Foundation Icons on Sass for Rails"
  s.email = ["oh@zaiste.net"]
  s.homepage = "https://github.com/zaiste/foundation-icons-sass-rails"
  s.rubyforge_project = "foundation-icons-sass-rails"
  s.rubygems_version = "2.4.5.1"
  s.summary = "Foundation Icons on Sass for Rails"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1.1"])
      s.add_runtime_dependency(%q<sass-rails>, [">= 3.1.1"])
    else
      s.add_dependency(%q<railties>, [">= 3.1.1"])
      s.add_dependency(%q<sass-rails>, [">= 3.1.1"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1.1"])
    s.add_dependency(%q<sass-rails>, [">= 3.1.1"])
  end
end
