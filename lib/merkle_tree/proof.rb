require 'pry'

class MerkleTree
  class Proof
    attr_reader :merkle_tree

    def initialize(merkle_tree)
      @merkle_tree = merkle_tree
    end

    def generate_and_verify_proof(index)
      proof = []
      level = 0
      while level < merkle_tree.levels.size
        proof << merkle_tree.levels[level]
        index = index / 2
        level += 1
      end
      proof

      verify_proof(proof, index, merkle_tree.root)
    end

    def verify_proof(proof, index, root)
      proof.each do |node|
        if index % 2 == 0
          root = MerkleTree::Node.new(node, root)
        else
          root = MerkleTree::Node.new(root, node)
        end
        index = index / 2
      end
      root.value == merkle_tree.root.value
    end
  end
end

