FactoryGirl.define do
  factory :image do
    filename { filename }
    ext { ext }
    fsize { fsize }
    tim { tim }
    url { url }
  end
end
