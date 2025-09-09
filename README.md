[![CI](https://github.com/spoddub/form-generator/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/spoddub/form-generator/actions/workflows/ci.yml)
[![hexlet-check](https://github.com/spoddub/form-generator/actions/workflows/hexlet-check.yml/badge.svg?branch=main)](https://github.com/spoddub/form-generator/actions/workflows/hexlet-check.yml)

# Form Generator

Form Generator is a small Ruby library for building HTML forms in application templates with a simple, declarative DSL. It addresses a common need and can be used on its own or alongside existing view code. The design emphasizes a clear separation between form structure and rendering, predictable output suitable for testing, and straightforward integration. The project draws inspiration from established solutions such as Rails form helpers and the Simple Form gem while remaining lightweight and well-suited for learning and test-driven development.

## Requirements

- Ruby **3.2.2**

## Usage

```ruby
require 'hexlet_code'

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new(name: 'rob', job: 'hexlet', gender: 'm')

html = HexletCode.form_for(user) do |f|
  f.input :name                          # => <input name="name" type="text" value="rob">
  f.input :job, as: :text, rows: 50, cols: 50
end

puts html
# <form action="#" method="post"><input name="name" type="text" value="rob"><textarea name="job" cols="50" rows="50">hexlet</textarea></form>
```

## Run

```bash
make lint
make test
```

## This project was built using these tools

| Tool                                             | Description                                                                 |
| ------------------------------------------------ | --------------------------------------------------------------------------- |
| [Ruby 3.2.2](https://www.ruby-lang.org/)         | The programming language the library is written in.                         |
| [rbenv](https://github.com/rbenv/rbenv)          | Per-project Ruby version manager used to pin **3.2.2** (`.ruby-version`).   |
| [Bundler](https://bundler.io/)                   | Dependency management and gem scaffolding (`bundle gem`, `bundle install`). |
| [Rake](https://ruby.github.io/rake/)             | Task runner for building, testing and release tasks (see `rake -T`).        |
| [Make](https://www.gnu.org/software/make/)       | Developer shortcuts: `make install`, `make lint`, `make test`.              |
| [Minitest](https://github.com/minitest/minitest) | Test framework used for TDD of the form DSL.                                |
| [RuboCop](https://rubocop.org/)                  | Linter/formatter enforcing consistent Ruby style.                           |
