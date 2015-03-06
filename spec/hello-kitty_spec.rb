require 'spec_helper'

describe HelloKitty do
  
  it 'gets IDs for addresses updated since the last run', :vcr do
    expect(HelloKitty.updates_since Time.now - 3600).to eq [
      '5eImTD',
      '5GZNIf'
    ]
  end
  
  it 'parses inference results for token', :vcr do
    results = HelloKitty.infer "rYwoGk"
    expect(results.count).to eq 34
    expect(results[0]['paon']).to eq 30
    expect(results[0]['provenance']['activity']["derived_from"][0]["type"]).to eq "inference"
  end
  

end
