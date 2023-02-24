require "spec_helper"

RSpec.describe Fms do
  it "has a version number" do
    expect(Fms::VERSION).not_to be nil
  end

  it "has version number 1.0.3" do
    expect(Fms::VERSION).to eq("1.0.3")
  end
end
