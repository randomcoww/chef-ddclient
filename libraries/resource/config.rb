class ChefDdclient
  class Resource
    class Config < Chef::Resource
      include Ddclient

      resource_name :ddclient_config

      default_action :create
      allowed_actions :create, :delete

      property :exists, [TrueClass, FalseClass]
      property :config, Hash
      property :content, String, default: lazy { to_conf }
      property :path, String, desired_state: false,
                              default: lazy { Ddclient::CONFIG_PATH }

      private

      def to_conf
        generate_config(config)
      end
    end
  end
end
