# frozen_string_literal: true

require_relative "lib/hexlet_code/version"

Gem::Specification.new do |spec|
  spec.name                  = "hexlet_code"
  spec.version               = HexletCode::VERSION
  spec.authors               = ["Sergei Poddubny"]
  spec.email                 = ["108150454+spoddub@users.noreply.github.com"]

  spec.summary               = "Form Generator – Ruby DSL for building HTML forms"
  spec.description           = "A small library for generating HTML forms in templates with a simple, declarative DSL. Inspired by Rails form helpers and Simple Form; focused on predictable output and TDD-friendly design."
  spec.homepage = "https://github.com/spoddub/form-generator"
  spec.license               = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.2.2")

  spec.metadata = {
    "homepage_uri" => "https://github.com/spoddub/form-generator",
    "source_code_uri" => "https://github.com/spoddub/form-generator",
    "changelog_uri" => "https://github.com/spoddub/form-generator/blob/main/CHANGELOG.md",
    "rubygems_mfa_required" => "true"
  }

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end

  spec.bindir       = "exe"
  spec.executables  = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
