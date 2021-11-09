require 'bundler'

Bundler.require

Aws.config.update({endpoint: "http://dynamodb-local:8000"})

class Comment
  include Aws::Record

  string_attr :commentable_id, hash_key: true
  string_attr :comment_id, range_key: true
  string_attr :body

  def self.where(commentable_id:)
    self.build_query.key_expr(":commentable_id = ?", commentable_id).complete!
  end
end

cfg = Aws::Record::TableConfig.define do |t|
  t.model_class(Comment)
  t.read_capacity_units(5)
  t.write_capacity_units(2)
end
cfg.migrate!

set :bind, '0.0.0.0'

get '/' do
  'OK'
end

post '/:commentable_id/comments' do |commentable_id|
  data = Oj.load(request.body.read)
  data[:commentable_id] = commentable_id
  data[:comment_id] = SecureRandom.uuid

  comment = Comment.new(data)
  comment.save

  Oj.dump comment.to_h
end

get '/:commentable_id/comments' do |commentable_id|
  comments = Comment.where(commentable_id: commentable_id)
  Oj.dump comments.map(&:to_h)
end

delete '/:commentable_id/comments/:comment_id' do |commentable_id, comment_id|
  comment = Comment.find(commentable_id: commentable_id, comment_id: comment_id)
  comment.delete!

  'OK'
end
