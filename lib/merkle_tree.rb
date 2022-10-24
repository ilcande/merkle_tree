require 'digest'

require_relative "merkle_tree/node"
require_relative "merkle_tree/proof"

class MerkleTree
  attr_accessor :levels, :root, :levels

  def initialize(*data)
    if data.size == 1 && data.first.is_a?(Array)
      data = data.first
    else
      data = data.map { |d| Digest::SHA1.hexdigest(d) }
    end

    @levels = MerkleTree.createMerkleTree(data)
    @root = @levels.first
    @height = MerkleTree.height(data)
  end

  def self.createMerkleTree(data)
    @levels ||= data.map { |d| MerkleTree::Node.new(nil, nil, d) }

    @levels[0] if @levels == 1

    while @levels.size > 1
      @levels = @levels.each_slice(2).map do |left, right|
        right = left unless right
        MerkleTree::Node.new(left, right)
      end
    end
   @levels
  end

  def level(index)
    [[@levels][index]]
  end

  def self.to_hash(data)
    sha = Digest::SHA1.new
    sha.update(data)
    sha.hexdigest
  end

  def root
    @root
  end

  def self.height(data)
    if data.size == 1
      0
    else
      1 + [MerkleTree.height(data[0..data.size/2 - 1]), MerkleTree.height(data[data.size/2..data.size])].max
    end
  end

  def height
    @height
  end
end

merkle_tree = MerkleTree.new(["L1", "L2", "L3", "L4"])

p MerkleTree.createMerkleTree(["L1", "L2", "L3", "L4"])

p merkle_tree.root

p merkle_tree.height

p merkle_tree.level(0)

p proof = MerkleTree::Proof.new(merkle_tree).generate_and_verify_proof(2)