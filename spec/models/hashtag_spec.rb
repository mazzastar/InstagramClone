require 'spec_helper'

describe Hashtag do
   it 'should be unique' do
     Hashtag.create(name: '#yolo')
     duplicate = Hashtag.new(name: '#yolo')
     expect(duplicate).to have(1).error_on(:name)
   end
end
