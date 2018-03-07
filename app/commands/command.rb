# frozen_string_literal: true
module Commands
  class Command
    def execute
      raise NotImplementedError
    end
  end
end
