require 'json'
require 'turbotlib'

class HelloKitty

  JESS = 'http://jess.openaddressesuk.org/infer'
#  SOURCE = 'https://alpha.openaddressesuk.org/'
  SOURCE = 'https://alpha.openaddressesuk.org/addresses.json?street=greenfinch+way&town=Horsham'

  def self.updates_since interval
    response = HTTPClient.new.get SOURCE
    j = JSON.parse(response.content)

    tokens = j['addresses'].map { |p| p['url'].split('/').last }

    tokens
  end
end
