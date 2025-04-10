# frozen_string_literal: true

require_relative "lib/our_first_gem/version"

Gem::Specification.new do |spec|
  spec.name = "our_first_gem"
  spec.version = OurFirstGem::VERSION
  spec.authors = ["Artem Vidishev", "Dmitry Zubkov", "Nikolay Krasilov", "Veronica Shpakova"]
  spec.email = ["vidishev@sfedu.ru", "dzubkov@sfedu.ru", "krasilov@sfedu.ru", "vshpakova@sfedu.ru"]

  spec.summary = "summary"
  spec.description = "description"
  spec.homepage = "https://github.com/klowitnarr/topic11"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/klowitnarr/topic11/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
