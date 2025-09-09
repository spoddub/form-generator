# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(entity)
      @entity = entity
      @fields = []
    end

    def input(name, as: :input, **attrs)
      value = @entity.public_send(name)

      case as
      when :text
        # textarea: дефолтные cols/rows, можно переопределить через attrs
        defaults = { name: name, cols: 20, rows: 40 }
        options = defaults.merge(attrs)
        @fields << Tag.build('textarea', options) { value.to_s }
      else
        # обычный input type="text"
        options = { name: name, type: 'text', value: value.to_s }.merge(attrs)
        @fields << Tag.build('input', options)
      end

      nil
    end

    def render
      @fields.join
    end
  end
end
