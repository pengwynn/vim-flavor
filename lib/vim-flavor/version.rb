module Vim
  module Flavor
    VERSION = '1.1.3'

    class Version < Gem::Version
      attr_accessor :original_tag_name

      def initialize(tag_name)
        @original_tag_name = tag_name
        super(self.class.normalize_tag_name(tag_name))
      end

      def self.normalize_tag_name(tag_name)
        tag_name.to_s.sub(/^v/, '')
      end

      def self.correct?(tag_name)
        super(normalize_tag_name(tag_name))
      end

      def to_s()
        @original_tag_name
      end
    end
  end
end
