require_relative '../../app/helpers/turbo_clone/frames_helper'

module TurboClone
  class Engine < ::Rails::Engine
    isolate_namespace TurboClone

    initializer "turbo.media_type" do
      Mime::Type.register "text/vnd.turbo-stream.html", :turbo_stream
    end

    initializer "turbo.renderer" do
      ActiveSupport.on_load :action_controller do
        ActionController::Renderers.add :turbo_stream do |turbo_streams_html, options|
          turbo_streams_html
        end
      end
    end

    initializer "turbo.helper" do
      ActiveSupport.on_load :action_controller_base do
        include TurboClone::Streams::TurboStreamsTagBuilder
        helper TurboClone::Engine.helpers
      end
    end
  end
end
