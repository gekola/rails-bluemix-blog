CarrierWave.configure do |config|
  if Rails.env.production?
    creds = JSON.parse(ENV['VCAP_SERVICES']).dig('Object-Storage', 0, 'credentials')
    config.storage = :fog
    config.fog_credentials = {
      provider:               'OpenStack',
      openstack_auth_url:     creds['auth_url'] + '/v3/auth/tokens',
      openstack_api_key:      creds['password'],
      openstack_project_id:   creds['projectId'],
      openstack_userid:       creds['userId'],
      openstack_region:       creds['region'],
      openstack_temp_url_key: ENV['OS_TEMP_URL_KEY']
    }
    config.fog_directory  = 'rails-5-blog-uploads'
    config.fog_public     = false
    config.fog_authenticated_url_expiration = 600
  end
end
