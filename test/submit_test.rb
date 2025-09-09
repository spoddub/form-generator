# frozen_string_literal: true

require 'test_helper'
require 'hexlet_code'

SubmitUser = Struct.new(:name, :job, keyword_init: true)

class SubmitTest < Minitest::Test
  def setup
    @user = SubmitUser.new(job: 'hexlet') # name => nil
  end

  def test_submit_with_default_text_and_labels
    html = HexletCode.form_for(@user) do |f|
      f.input :name
      f.input :job
      f.submit
    end

    expected = '<form action="#" method="post">' \
               '<label for="name">Name</label>' \
               '<input name="name" type="text" value="">' \
               '<label for="job">Job</label>' \
               '<input name="job" type="text" value="hexlet">' \
               '<input type="submit" value="Save">' \
               '</form>'

    assert_equal expected, html
  end

  def test_submit_with_custom_text
    html = HexletCode.form_for(@user, url: '#') do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    expected = '<form action="#" method="post">' \
               '<label for="name">Name</label>' \
               '<input name="name" type="text" value="">' \
               '<label for="job">Job</label>' \
               '<input name="job" type="text" value="hexlet">' \
               '<input type="submit" value="Wow">' \
               '</form>'

    assert_equal expected, html
  end
end
