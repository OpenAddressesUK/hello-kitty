require 'spec_helper'

describe HelloKitty do
  it 'gets IDs for addresses updated since the last run', :vcr do
    expect(HelloKitty.updates_since Time.now - 3600).to eq [
      '5eImTD',
      '5GZNIf'
    ]
  end


end
