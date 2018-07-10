class UploadFilesController < ApplicationController
  def new
  end

  def create
    new_filename = Rails.root.join('storage', File.basename(params['file'].path))
    FileUtils.cp params['file'].path, new_filename
    SkuWorker.perform_async(new_filename, params['file'].original_filename)
  end
end
