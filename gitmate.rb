module Gitmate
  class CLI < Thor
    desc 'C card_id'.green, 'Switch to the specified branch'.green
    def c card_id = nil
      GitExt.checkout card_id
    end

    desc 'M card_id'.green, 'Merge current branch with specified one'.green
    def m card_id = nil
      p "merge"
      # Gitmate::GitExt.merge card_id
    end

    desc 'D card_id'.green, 'Delete the specified branch'.green
    def d card_id = nil
      p "delete"
      # Gitmate::GitExt.merge card_id
    end

    desc 'help'.yellow, ''
    def help
      super
    end

    desc 'version'.green, 'show current version'.green
    def version
      puts "1.0.0 by Zihang".green
    end

    def method_missing(name, *args)
      c(name)
    end

    default_task :c
  end
end
