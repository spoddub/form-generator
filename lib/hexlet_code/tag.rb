# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(name, attrs = {})
      name = name.to_s
      attrs_str = build_attrs(attrs)

      if SINGLE_TAGS.include?(name)
        "<#{name}#{attrs_str}>"
      else
        content = block_given? ? yield : ''
        "<#{name}#{attrs_str}>#{content}</#{name}>"
      end
    end

    def self.build_attrs(attrs)
      return '' if attrs.nil? || attrs.empty?

      attrs
        .sort_by { |k, _| k.to_s }
        .map { |k, v| " #{k}=\"#{v}\"" }
        .join
    end
  end
end
