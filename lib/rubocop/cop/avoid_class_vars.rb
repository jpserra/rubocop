# encoding: utf-8

module Rubocop
  module Cop
    class AvoidClassVars < Cop
      def self.portable?
        true
      end

      def inspect(file, source, tokens, sexp)
        on_node(:cvdecl, sexp) do |s|
          class_var = s.source_map.name.to_source
          lineno = s.source_map.name.line

          add_offence(
            :convention,
            lineno,
            "Replace class var #{class_var} with a class instance var."
          )
        end
      end
    end
  end
end
