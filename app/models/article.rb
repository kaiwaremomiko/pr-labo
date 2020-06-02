class Article < ApplicationRecord
    mount_uploader :img, ImgUploader
    
    def to_param
        slug
    end
end
