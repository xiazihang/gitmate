module Gitmate
  class Git
    class << self
      def checkout branch
        `git checkout #{branch}`
      end

      def remote_update
        `git remote update -p`
      end

      def merge branch
        `git merge #{branch}`
      end

      def delete branch
        `git branch -d #{branch}`
      end

      def delete_remote branch
        `git push origin --delete #{branch}`
      end
    end
  end
end
