
module TurboClone
  class Engine < ::Rails::Engine
    isolate_namespace TurboClone

    initializer 'turbo_clone.action_controller' do |app|
      ActiveSupport.on_load :action_controller_base do
        helper TurboClone::FramesHelper
      end
    end
  end
end
