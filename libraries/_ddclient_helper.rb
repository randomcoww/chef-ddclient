module DdclientHelper
  CONFIG_PATH ||= '/etc/ddclient.conf'

  class ConfigGenerator
    ## sample source config
    # {
    #   "daemon" => "10m",
    #   "use" => "web",
    #   "web" => "http://icanhazip.com/",
    #   "web-skip" => '',
    #   "server" => "freedns.afraid.org",
    #   "protocol" => "freedns",
    #   "login" => "login",
    #   "password" => "password",
    #   "host.test.local" => nil
    # }

    def self.generate_from_hash(config_hash)
      out = []

      config_hash.each do |k, v|
        case v
        when String,Integer
          out << [k, v].join('=')
        when NilClass
          out << k
        end
      end
      return out.join($/)
    end
  end
end
