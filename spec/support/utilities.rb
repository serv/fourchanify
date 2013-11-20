def get_first_thread_no(board)
  Fourchanify::Request.get_first_thread_no(board)
end

def get_image_count(board, thread_id)
  Fourchanify::Request.get_image_count(board, thread_id)
end

def board_names_list
  FourchanUrler.boards_list
end

def get_images(board, thread_id)
  posts = Request.get_posts(board, thread_id)
  posts_with_images = posts.select {|p| p["filename"] && p["ext"] }

  images = []
  posts_with_images.each do |p|
    images << Image.prepare(:filename => p["filename"],
      :ext => p["ext"], :fsize => p["fsize"], :tim => p["tim"])
  end
  images
end