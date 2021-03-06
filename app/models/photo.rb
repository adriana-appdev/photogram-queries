# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
    def poster
        return User.where({:id => self.owner_id}).first
    end 
    
    def comments
        return Comment.where({:photo_id => self.id})
    end 
    
    def likes
        return Like.where({:photo_id => self.id})
    end 
    #had problems applying this on the data- I believe because of the (s) at the end of likes # 
    
    def fans 
        fan_ids = self.likes.pluck(:fan_id)
        return User.where({ :id => fan_ids })
    end
    # I also had problems applying this method on Photo. I tried ID = 628#
    
    def fan_list
        return self.fans.pluck(:username).to_sentence
    end 
end
