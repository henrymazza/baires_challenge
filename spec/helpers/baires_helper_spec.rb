require 'rails_helper'

RSpec.describe 'Brackets Pairs Challenge' do
  def balanced(str)
    return false if str.empty?

    pairs = [
      ['(', ')'],
      ['[', ']'],
      ['{', '}']
    ]
    opener = pairs.map { |pair| pair[0] }
    closer = pairs.map { |pair| pair[1] }

    stack = []

    str.split('').each do |c|
      if opener.include? c
        stack.append c
      elsif closer.include? c
        # if char forms a pair with last element of stack
        if pairs.reject { |p| p == [stack.last, c] }.size < 3
          stack.pop
        # pair mismatch otherwise
        else
          return false
        end
      end
    end

    stack.empty?
  end

  describe '#balanced' do
    context 'when pairs are balanced' do
      it 'returns true' do
        expect(balanced('(a[0]+b[2c[6]]) {24 + 53}')).to be true
      end
      it 'returns true' do
        expect(balanced('f(e(d))')).to be true
      end
      it 'returns true' do
        expect(balanced('[()]{}([])')).to be true
      end
    end

    context 'when pairs are not balanced' do
      it 'returns false' do
        expect(balanced('((b) ')).to be false
      end
      it 'returns false' do
        expect(balanced('(c] ')).to be false
      end
      it 'returns false' do
        expect(balanced('{(a[])')).to be false
      end
      it 'returns false' do
        expect(balanced('([)]')).to be false
      end
      it 'returns false' do
        expect(balanced(')( ')).to be false
      end
    end

    context 'when string is empty' do
      it 'returns false' do
        expect(balanced('')).to be false
      end
    end
  end
end
