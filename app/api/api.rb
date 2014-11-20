
class API < Grape::API
  version :v1, using: :accept_version_header, format: :json, default_format: :json do 

    mount MyApi::V1::Ping

  end

end
