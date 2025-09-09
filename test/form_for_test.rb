# frozen_string_literal: true

require 'test_helper'
require 'hexlet_code'

User = Struct.new(:name, :job, keyword_init: true)

class FormForTest < Minitest::Test
  def setup
    @user = User.new(name: 'rob')
  end

  def test_empty_form_with_defaults
    html = HexletCode.form_for(@user) { |f| }
    expected = '<form action="#" method="post"></form>'
    assert_equal expected, html
  end

  def test_empty_form_with_url_and_class
    html = HexletCode.form_for(@user, url: '/profile', class: 'hexlet-form') { |f| }
    expected = '<form action="/profile" method="post" class="hexlet-form"></form>'
    assert_equal expected, html
  end
end
