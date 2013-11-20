module Fourchanify
  class Request
    attr_accessor :url, :board, :thread_id, :image_count, :images

    def self.prepare(url)
      fourchan_url = FourchanUrler::Request.new(url)

      request = Request.new
      request.url = url
      request.board = fourchan_url.board
      request.thread_id = fourchan_url.thread_id
      request.prepare_images
      request
    end

    def self.get_posts(board, thread_id)
      sleep 1
      api_url = "http://api.4chan.org/#{board}/res/#{thread_id}.json"
      begin
        json = JSON.parse(open(api_url).read)
        json["posts"]
      rescue
        raise JSONError, "JSON processing failed. Please try again"
      end
    end

    def self.get_first_thread_no(board)
      sleep 1
      api_url = "http://api.4chan.org/#{board}/threads.json"
      begin
        json = JSON.parse(open(api_url).read)
        json.first['threads'].first['no']
      rescue
        raise JSONError, "JSON processing failed. Please try again"
      end
    end

    def self.get_image_count(board, thread_id)
      posts = self.get_posts(board, thread_id)
      posts.first["images"]
    end

    def self.download(url)
      request = Request.prepare(url)
      directory_name = request.create_directory
      request.broadcast
      request.images.each do |image|
        image.download(directory_name)
      end
      puts "\n"
    end

    def broadcast
      puts "=== Fourchanify ==="
      puts "images: #{self.image_count}"
    end

    def create_directory
      directory_name = "#{self.board}_#{self.thread_id}"
      Dir.mkdir("./#{directory_name}")
      directory_name
    end

    def prepare_images
      posts = Request.get_posts(self.board, self.thread_id)
      posts_with_images = posts.select {|p| p["filename"] && p["ext"] }

      # images in replies + the image of OP
      self.image_count = posts.first["images"] + 1
      self.images = []

      posts_with_images.each do |p|
        image = Image.prepare(:filename => p["filename"], :ext => p["ext"],
          :fsize => p["fsize"], :tim => p["tim"], :board => self.board)
        self.images << image
      end
    end
  end
end
