class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_url(*args)
    "xau7bbew6h2y2iofojc2.png"
  end
end
