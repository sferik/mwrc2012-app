class ImagesController < ApplicationController

  def show
    @image = Image.root.join([params[:resource], params[:format]].join('.'))
    if File.exists?(@image)
      mime_type = Mime::Type.lookup_by_extension(File.extname(@image).sub('.', ''))
      send_file @image, :type => mime_type.to_s, :disposition => 'inline'
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
