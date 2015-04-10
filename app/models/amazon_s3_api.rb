class AmazonS3Api

  @s3 = Aws::S3::Client.new

  def self.upload_user_file_to_bucket file_name, file #TODO- add content type here
    @s3.put_object(key: "/user_audio_samples/#{file_name}", bucket: 'educaling', content_type: "audio/vnd.wave", body: file)
  end

  def self.upload_forvo_to_bucket file_name, file #TODO- add content type here
    @s3.put_object(key: "/forvo_audios/#{file_name}", bucket: 'educaling', content_type: "audio/ogg", body: file)
  end


end