require "./spec_helper"

describe Getopt do
  # TODO: Write tests

  it "works" do
    Getopt.short("ab:c").should eq(-1)
  end
end
