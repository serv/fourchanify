module Fourchanify
  class Image
    attr_accessor :filename, :ext, :fsize, :tim, :board, :url, :directory_name

    def self.prepare(attributes)
      image = Image.new
      image.filename = attributes[:filename]
      image.ext = attributes[:ext]
      image.fsize = attributes[:fsize]
      image.tim = attributes[:tim]
      image.board = attributes[:board]
      image.set_url
      image
    end

    def set_url
      self.url = self.get_url
    end

    def get_url
      "http://images.4chan.org/#{self.board}/src/#{self.tim}#{self.ext}"
    end

    def download(directory_name)
      self.directory_name = directory_name
      self.save
      print "."
    end

    def save
      open("#{self.directory_name}/#{self.tim}#{self.ext}", 'wb') do |file|
        file << open(self.url).read
      end
      sleep 1
    end
  end
end
