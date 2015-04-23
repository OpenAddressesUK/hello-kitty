require 'spec_helper'

describe HelloKitty do

  it 'gets IDs for addresses updated since the last run', :vcr do
    Timecop.freeze(2015,3,19,11,24) do
      tokens = []
      HelloKitty.updates_since Time.now - 1 do |token|
        tokens << token
      end
      expect(tokens.count).to eq 30
      expect(tokens.first).to eq "2nZkzQ"
      expect(tokens.last).to eq "CvcUkx"
    end
  end

  it 'retries if there is a temporary issue with Theodolite' do
    stub_request(:get, 'http://example.com').
                to_return(status: 500).
                times(5).then.
                to_return(status: 200)

    expect(HelloKitty).to receive(:sleep) { nil }.at_least(1).times

    expect { HelloKitty.request_with_retries("http://example.com") }.to output("Hit error, trying again in 5 seconds\nHit error, trying again in 10 seconds\nHit error, trying again in 15 seconds\nHit error, trying again in 20 seconds\nHit error, trying again in 25 seconds\n").to_stderr
  end

  it 'parses inference results for token', :vcr do
    results = HelloKitty.infer "rYwoGk"
    expect(results.count).to eq 34
    expect(results[0]['paon']).to eq 30
    expect(results[0]['provenance']['activity']["derived_from"][0]["type"]).to eq "inference"
  end


end
