module Gitmate
  class Git
    class << self
      def checkout branch
        `git checkout #{branch}`
      end

      def remote_update
        `git remote update -p`
      end
    end
  end
end
