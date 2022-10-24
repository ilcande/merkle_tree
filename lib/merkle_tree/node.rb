require 'digest/sha1'

class MerkleTree
  class Node
    attr_reader :left, :right, :value, :height

    def initialize(left, right, value = Digest::SHA1.hexdigest(left.value + right.value))
      @left = left
      @right = right
      @value = value
    end
  end
end

