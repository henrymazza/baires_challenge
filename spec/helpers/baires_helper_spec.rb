require 'rails_helper'


RSpec.describe 'Parenthesis Challenge' do

  def balanced(str)
    parent = 0
    square = 0
    curly = 0

    return false if str.empty?

    str.split('').each { |c|
      case c
      when "}"
        curly = curly - 1
      when "{"
        curly = curly + 1
      when ")"
        parent = parent - 1
      when "("
        parent = parent + 1
      when "]"
        square = square - 1
      when "["
        square = square + 1
      end
      return false if square != 0 || curly != 0 || parent != 0
    }
    true
  end

   describe 'index page' do
    it 'shows the right content' do
      expect(balanced("(a[0]+b[2c[6]]) {24 + 53}")).to be true
    end
    it 'shows the right content' do
      expect(balanced "f(e(d))").to be true
    end
    it 'shows the right content' do
      expect(balanced("[()]{}([])")).to be true
    end
    it 'shows the right content' do
      expect(balanced("((b) ")).to be false
    end
    it 'shows the right content' do
      expect(balanced "(c] ").to be false
    end
    # it 'shows the right content' do
    #   expect({(a[]) ).to be false
    #       end
    #         it 'shows the right content' do
    #           expect(([)] ).to be false
    #         end
    #   it 'shows the right content' do
    # it 'shows the right content' do
    #   expect(")( ").to be false
    # end
    it 'shows the right content' do
      expect(balanced("")).to be false
    end
   end

end