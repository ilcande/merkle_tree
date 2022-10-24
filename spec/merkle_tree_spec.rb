require 'spec_helper'
require './lib/merkle_tree'

RSpec.describe MerkleTree do
  let(:data) { %w[foo bar baz] }
  let(:merkle_tree) { MerkleTree.new(data) }
  let(:proof) { MerkleTree::Proof.new(merkle_tree) }

  describe '#initialize' do
    it 'creates a merkle tree' do
      expect(merkle_tree.levels.size).to eq(1)
    end
  end

  describe '#root' do
    it 'returns the root of the merkle tree' do
      expect(merkle_tree.root.value).to eq("c95c74ac8566d2a67ddeaee5e991d635f6bf6b34")
    end
  end

  describe '#height' do
    it 'returns the height of the merkle tree' do
      expect(merkle_tree.height).to eq(2)
    end
  end

  describe '#level' do
    it 'returns the nodes at a given level' do
      expect(merkle_tree.level(0).size).to eq(1)
      expect(merkle_tree.level(1).size).to eq(1)
      expect(merkle_tree.level(2).size).to eq(1)
    end
  end

  describe '#generate_and_verify_proof' do
    it 'generates a proof and verifies it' do
      proof_to = proof.generate_and_verify_proof(0)
      expect(proof_to).to be_falsey
    end
  end
end
