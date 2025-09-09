# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  def self.form_for(_entity, **options, &block)
    action = options.key?(:url) ? options.delete(:url) : '#'
    method = 'post'
    form_attrs = { action:, method: }.merge(options)
    builder = FormBuilder.new(entity)
    block&.call(builder)
    Tag.build('form', form_attrs) { body }
  end
end
