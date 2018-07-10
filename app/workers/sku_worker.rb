class SkuWorker
  include Sidekiq::Worker

  def perform(filename, original_filename)
    ParseUploadedFile.call(filename: filename, original_filename: original_filename)
    File.unlink(filename)
  end
end
