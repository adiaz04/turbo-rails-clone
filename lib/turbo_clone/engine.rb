
module TurboClone
  class Engine < ::Rails::Engine
    isolate_namespace TurboClone

    initializer "turbo.media_type" do
      Mime::Type.register "text/vnd.turbo-stream.html", :turbo_stream
    end

    initializer 'turbo_clone.action_controller' do |app|
      ActiveSupport.on_load :action_controller_base do
        TurboClone.constants.each do |constant|
          mod = TurboClone.const_get(constant)
          helper mod if mod.is_a?(Module) && !mod.is_a?(Class)
        end
      end
    end
  end
end
