include SpecHelper
describe 'User facing API' do

  it 'frozen and unfrozen strings should be identical, but different object ids' do
    basic_test 'easy'
  end

  it 'should deep dup arrays' do
    basic_test [1,2,3, [4]] do |before, after|
      after.last.should.equal [4]
    end
  end
end