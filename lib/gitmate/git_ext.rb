module Gitmate
  class GitExt
    class << self
      def checkout card_id
        branch = parse card_id
        Git.chackout branch
      end

      private

      def parse card_id, default_branch = 'develop'
        card_id = default_branch if card_id.nil?
        if card_id == '-'
          branches = ['-']
        else
          branches = find_branches_by_card_id card_id
          Git.remote_update if branches.empty?
          branches = find_branches_by_card_id card_id
        end
        branch = select_multiple_branch branches, card_id
        if branch.nil?
          puts 'Oops! No branch found!'.red
          exit(1)
        end
        branch
      end

      def select_multiple_branch branches, card_id
        if branches.size > 1
          puts "#{card_id} is related to more than one branch, please input the number behind to select: ".red
          branches.each_with_index do | b, index |
            puts "[#{index + 1}]" + " #{b}"
          end
          select = Readline.readline("> ", true)
          exit(1) if select.to_i > branches.size || select.to_i <= 0
          branches[select.to_i - 1]
        else
          branches.first
        end
      end

      def find_branches_by_card_id card_id
        branches = `git branch -a | grep #{card_id}`
        return [] if branches == ""
        if card_id =~ /^\d+$/
          branches.split("\n").map{|b| b.scan(/feature\/\S+/)}.flatten.uniq
        else
          [card_id]
        end
      end
    end
  end
end
