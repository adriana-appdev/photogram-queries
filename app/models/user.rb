# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  comments_count :integer
#  likes_count    :integer
#  private        :boolean
#  username       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ApplicationRecord
    def comments
    return Comment.where({:author_id => self.id})
    end 
    #I have troubble applying this method. I have defined B as the User.where ID = 81. When I do B. comments it gives me error but the program says it is correct"

    def own_photos
        return Photo.where({:owner_id => self.id})
    end 
    # P = photo.first, when I apply the method I get a mistake here# 
end
