# freeze_string_literal: true
require 'rails_helper'

RSpec.describe TurboClone::FramesHelper, type: :helper do
  describe '#turbo_frame_tag' do
    context 'when resource responds to to_key' do
      it 'generates a turbo frame with the DOM ID of the resource' do
        resource = double('Resource', to_key: [1])
        allow(helper).to receive(:dom_id).with(resource).and_return('resource_1')

        expect(helper.turbo_frame_tag(resource)).to eq('<turbo-frame id="resource_1"></turbo-frame>')
      end
    end

    context 'when resource does not respond to to_key' do
      it 'generates a turbo frame with the given resource as the ID' do
        resource = 'static_id'

        expect(helper.turbo_frame_tag(resource)).to eq('<turbo-frame id="static_id"></turbo-frame>')
      end
    end

    context 'when a block is given' do
      it 'generates a turbo frame with content inside' do
        resource = 'frame_with_content'
        content = 'Content within the turbo frame'

        output = helper.turbo_frame_tag(resource) { content }
        expect(output).to eq('<turbo-frame id="frame_with_content">Content within the turbo frame</turbo-frame>')
      end
    end
  end
end
