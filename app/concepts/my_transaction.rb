class MyTransaction
  def self.call((ctx, flow_options), *, &block)
    result = ActiveRecord::Base.transaction { yield }

    signal = result ? Trailblazer::Operation::Railway.pass! : Trailblazer::Operation::Railway.fail!

    [ signal, [ctx, flow_options] ]
  end
end