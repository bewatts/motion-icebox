module SpecHelper
  def basic_test(before)
    Icebox.freeze(before, :string)
    after = Icebox.unfreeze(:string)
    after.object_id.should.not.equal before.object.id
    after.should.equal before
    yield(before, after)
  end
end