require 'grape-swagger'

class API < Grape::API
  version :v1, using: :accept_version_header, format: :json, default_format: :json do 

    mount MyApi::V1::Ping

    add_swagger_documentation(mount_path: '/doc/swagger_doc', base_path: '/api')

  end

end
