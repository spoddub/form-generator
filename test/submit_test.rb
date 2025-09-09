# frozen_string_literal: true

require 'test_helper'
require 'hexlet_code'

SubmitUser = Struct.new(:name, :job, keyword_init: true)

SUBMIT_EXPECTED_DEFAULT =
  '<form action="#" method="post">' \
  '<label for="name">Name</label>' \
  '<input name="name" type="text" value="">' \
  '<label for="job">Job</label>' \
  '<input name="job" type="text" value="hexlet">' \
  '<input type="submit" value="Save">' \
  '</form>'

SUBMIT_EXPECTED_CUSTOM =
  '<form action="#" method="post">' \
  '<label for="name">Name</label>' \
  '<input name="name" type="text" value="">' \
  '<label for="job">Job</label>' \
  '<input name="job" type="text" value="hexlet">' \
  '<input type="submit" value="Wow">' \
  '</form>'

class SubmitTest < Minitest::Test
  def setup
    @user = SubmitUser.new(job: 'hexlet')
  end

  def build_form(options = {}, &)
    HexletCode.form_for(@user, **options, &)
  end

  def test_submit_with_default_text_and_labels
    html = build_form do |f|
      f.input(:name)
      f.input(:job)
      f.submit
    end
    assert_equal SUBMIT_EXPECTED_DEFAULT, html
  end

  def test_submit_with_custom_text
    html = build_form(url: '#') do |f|
      f.input(:name)
      f.input(:job)
      f.submit('Wow')
    end
    assert_equal SUBMIT_EXPECTED_CUSTOM, html
  end
end
