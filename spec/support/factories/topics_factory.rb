# coding: UTF-8

module Curso
  module Factories
    def new_topic(attributes = {})
      attributes = attributes.dup
      topic = Topic.new
      topic.name = attributes[:name] || String.random(10)
      topic.abstract = attributes[:abstract] || String.random(20)
      topic
    end

    def create_topic(attributes = {})
      topic = new_topic(attributes)
      topic.save
      topic
    end

  end
end