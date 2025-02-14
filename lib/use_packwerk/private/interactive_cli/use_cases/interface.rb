# typed: strict

module UsePackwerk
  module Private
    module InteractiveCli
      module UseCases
        module Interface
          extend T::Sig
          extend T::Helpers

          interface!

          sig { params(base: Class).void }
          def self.included(base)
            @use_cases ||= T.let(@use_cases, T.nilable(T::Array[Class]))
            @use_cases ||= []
            @use_cases << base
          end

          sig { returns(T::Array[Interface]) }
          def self.all
            T.unsafe(@use_cases).map(&:new)
          end

          sig { abstract.params(prompt: TTY::Prompt).void }
          def perform!(prompt); end

          sig { abstract.returns(String) }
          def user_facing_name; end
        end
      end
    end
  end
end
