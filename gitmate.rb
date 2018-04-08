module Gitmate
  class CLI < Thor
    desc 'c card_id'.green, 'Switch to the specified branch'.green
    def c card_id = nil
      GitExt.checkout card_id
    end

    desc 'm card_id'.green, 'Merge current branch with specified one'.green
    def m card_id = nil
      #TODO
      # Gitmate::GitExt.merge card_id
      p "merge branch"
    end

    desc 'd card_id'.green, 'Delete the specified branch'.green
    def d card_id = nil
      #TODO
      # Gitmate::GitExt.merge card_id
      p "delete local"
    end

    desc 'rd card_id'.green, 'Delete the specified remote branch'.green
    def remote_delete card_id = nil
      #TODO
      # Gitmate::GitExt.remote_delete card_id
      p "remote delete"
    end

    desc 'delete_remote '.green, 'Delete the merged remote branches'.green
    def delete_remote
      GitExt.delete_remote_merged_branches
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
