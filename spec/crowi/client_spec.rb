require "spec_helper"

RSpec.describe Crowi::Client do
  let(:base_url) { nil }
  let(:access_token) { nil }
  let(:options) do
    {
      base_url: base_url,
      access_token: access_token,
    }
  end
  subject(:client) { described_class.new(options) }

  %i(get post put patch delete).each do |method|
    describe "##{method}" do
      let(:path)    { '/path' }
      let(:params)  { { params: 'params' } }
      let(:headers) { { headers: 'headers' } }
      it "call send_request with method, path, params and headers" do
        expect(client).to receive(:send_request).with(method, path, params, headers)
        client.__send__("#{method}", path, params, headers)
      end
    end
  end
end
