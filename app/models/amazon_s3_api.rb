class AmazonS3Api

  @s3 = Aws::S3::Client.new

  def upload_user_file_to_bucket file_name, file #TODO- add content type here
    @s3.put_object(key: "/user_audio_samples/#{file_name}", bucket: 'educaling', body: file)
  end

  def upload_forvo_to_bucket file_name, file #TODO- add content type here
    @s3.put_object(key: "/forvo_audios/#{file_name}", bucket: 'educaling', body: file)
  end


end