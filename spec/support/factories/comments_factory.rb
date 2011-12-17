# coding: UTF-8

module Curso
  module Factories
    def new_comment(attributes = {})
      attributes = attributes.dup
      comment = Comment.new
      comment.text = attributes[:text] || String.random(10)
      comment.topic = attributes[:topic] || create_topic
      if attributes[:user]
        comment.user = attributes[:user]
      elsif attributes[:user_id]
        comment.user_id = attributes[:user_id]
      else
        comment.user = create_user
      end
      comment
    end

    def create_comment(attributes = {})
      comment = new_comment(attributes)
      comment.save
      comment
    end
  end
end