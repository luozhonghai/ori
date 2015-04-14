class TestModel < ActiveRecord::Base
  turntable :user_cluster, :id
  
  sequencer :user_seq_1
end
