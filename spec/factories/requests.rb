FactoryGirl.define do
  factory :request do
    url { "http://boards.4chan.org/#{board}/res/#{thread_id}" }
    board { board }
    thread_id { thread_id }
    image_count { image_count }
    images { images }
  end
end