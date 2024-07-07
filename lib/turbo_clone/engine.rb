require_relative '../../app/helpers/turbo_clone/frames_helper'

module TurboClone
  class Engine < ::Rails::Engine
    isolate_namespace TurboClone

    initializer "turbo.media_type" do
      Mime::Type.register "text/vnd.turbo-stream.html", :turbo_stream
    end

    initializer 'turbo_clone.action_controller' do |app|
      require 'action_controller/base'
      ActiveSupport.on_load :action_controller_base do
        helper TurboClone::FramesHelper
      end
    end
  end
end
