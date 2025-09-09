# frozen_string_literal: true

require 'test_helper'
require 'hexlet_code'

InputUser = Struct.new(:name, :job, :gender, keyword_init: true)

INPUT_EXPECTED_DEFAULTS =
  '<form action="#" method="post">' \
  '<label for="name">Name</label>' \
  '<input name="name" type="text" value="rob">' \
  '<label for="job">Job</label>' \
  '<textarea name="job" cols="20" rows="40">hexlet</textarea>' \
  '</form>'

INPUT_EXPECTED_EXTRA_ATTRS =
  '<form action="#" method="post">' \
  '<label for="name">Name</label>' \
  '<input name="name" type="text" value="rob" class="user-input">' \
  '<label for="job">Job</label>' \
  '<input name="job" type="text" value="hexlet">' \
  '</form>'

INPUT_EXPECTED_TEXTAREA_OVERRIDE =
  '<form action="#" method="post">' \
  '<label for="job">Job</label>' \
  '<textarea name="job" cols="50" rows="50">hexlet</textarea>' \
  '</form>'

class InputTest < Minitest::Test
  def setup
    @user = InputUser.new(name: 'rob', job: 'hexlet', gender: 'm')
  end

  def build_form(options = {}, &)
    HexletCode.form_for(@user, **options, &)
  end

  def test_text_and_textarea_defaults
    html = build_form do |f|
      f.input(:name)
      f.input(:job, as: :text)
    end
    assert_equal INPUT_EXPECTED_DEFAULTS, html
  end

  def test_input_with_extra_attrs
    html = build_form(url: '#') do |f|
      f.input(:name, class: 'user-input')
      f.input(:job)
    end
    assert_equal INPUT_EXPECTED_EXTRA_ATTRS, html
  end

  def test_textarea_override_rows_cols
    html = build_form { |f| f.input(:job, as: :text, rows: 50, cols: 50) }
    assert_equal INPUT_EXPECTED_TEXTAREA_OVERRIDE, html
  end

  def test_missing_field_raises
    assert_raises(NoMethodError) { build_form { |f| f.input :age } }
  end
end
