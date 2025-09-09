# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  def self.form_for(entity, **options, &block)
    action = options.key?(:url) ? options.delete(:url) : '#'
    method = 'post'
    form_attrs = { action:, method: }.merge(options)
    block.call(nil) if block
    Tag.build('form', form_attrs) { '' }
  end
end
