# frozen_string_literal: true

require 'test_helper'
require 'hexlet_code'

InputUser = Struct.new(:name, :job, :gender, keyword_init: true)

class InputTest < Minitest::Test
  def setup
    @user = InputUser.new(name: 'rob', job: 'hexlet', gender: 'm')
  end

  def test_text_and_textarea_defaults
    html = HexletCode.form_for(@user) do |f|
      f.input :name
      f.input :job, as: :text
    end
    expected = '<form action="#" method="post">' \
               '<input name="name" type="text" value="rob">' \
               '<textarea name="job" cols="20" rows="40">hexlet</textarea>' \
               '</form>'
    assert_equal expected, html
  end

  def test_input_with_extra_attrs
    html = HexletCode.form_for(@user, url: '#') do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    expected = '<form action="#" method="post">' \
               '<input name="name" type="text" value="rob" class="user-input">' \
               '<input name="job" type="text" value="hexlet">' \
               '</form>'
    assert_equal expected, html
  end

  def test_textarea_override_rows_cols
    html = HexletCode.form_for(@user) do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    expected = '<form action="#" method="post">' \
               '<textarea name="job" cols="50" rows="50">hexlet</textarea>' \
               '</form>'

    assert_equal expected, html
  end

  def test_missing_field_raises
    assert_raises(NoMethodError) do
      HexletCode.form_for(@user) { |f| f.input :age }
    end
  end
end
