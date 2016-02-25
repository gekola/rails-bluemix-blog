class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  version :thumb do
    process resize_to_fill: [200,100]
  end

  def default_url
    'https://upload.wikimedia.org/wikipedia/commons/4/47/Comic_image_missing.png'
  end
end
