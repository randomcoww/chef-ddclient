class ChefDdclient
  class Provider
    class Config < Chef::Provider
      provides :ddclient_config, os: "linux"

      def load_current_resource
        @current_resource = ChefDdclient::Resource::Config.new(new_resource.name)

        current_resource.exists(::File.exist?(new_resource.path))

        if current_resource.exists
          current_resource.content(::File.read(new_resource.path).chomp)
        else
          current_resource.content('')
        end

        current_resource
      end

      def action_create
        converge_by("Create ddclient config: #{new_resource}") do
          ddclient_config.run_action(:create)
        end if !current_resource.exists || current_resource.content != new_resource.content
      end

      def action_delete
        converge_by("Delete ddclient config: #{new_resource}") do
          ddclient_config.run_action(:delete)
        end if current_resource.exists
      end

      private

      def ddclient_config
        @ddclient_config ||= Chef::Resource::File.new(new_resource.path, run_context).tap do |r|
          r.path new_resource.path
          r.content new_resource.content
        end
      end
    end
  end
end
