# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(entity)
      @entity = entity
      @fields = []
    end

    def input(name, as: :input, **attrs)
      value = @entity.public_send(name)

      if as == :text
        @fields << build_textarea(name, value, **attrs)
      else
        @fields << build_label(name)
        @fields << build_input(name, value, **attrs)
      end
      nil
    end

    def submit(text = 'Save', **attrs)
      options = { type: 'submit', value: text }.merge(attrs)
      @fields << Tag.build('input', options)
      nil
    end

    def render
      @fields.join
    end

    private

    def build_label(name)
      Tag.build('label', for: name) { name.to_s.capitalize }
    end

    def build_textarea(name, value, **attrs)
      options = { name: name, cols: 20, rows: 40 }.merge(attrs)
      Tag.build('textarea', options) { value.to_s }
    end

    def build_input(name, value, **attrs)
      options = { name: name, type: 'text', value: value.to_s }.merge(attrs)
      Tag.build('input', options)
    end
  end
end
