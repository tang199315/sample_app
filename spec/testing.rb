require 'spec_helper'
$count = 0
RSpec.describe "let" do
  let(:count) { $count += 1 }

  it "1" do
  	count.should == 1
  	count.should == 1
  	count.should == 2

  end

  it "2" do
  	count.should == 2
  end

  it "3" do
  	 count.should == 3
  end

end