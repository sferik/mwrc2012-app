class Image

  class << self

    def root
      @@root ||= Rails.root.join('app', 'assets', 'images')
    end

  end

end
