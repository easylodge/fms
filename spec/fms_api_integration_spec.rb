require "spec_helper"

RSpec.describe FmsApiIntegration do
  it "has a version number" do
    expect(FmsApiIntegration::VERSION).not_to be nil
  end

  it "has version number 1.0.0" do
    expect(FmsApiIntegration::VERSION).to eq("1.0.0")
  end
end
