class ImagePayloadUploader < BaseUploader
  def content_type_whitelist
    /image\//
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
