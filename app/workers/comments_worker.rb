class CommentsWorker
  include Sidekiq::Worker

  def perform(user_id, comment_id)
    user = User.find(user_id)
    comment = Comment.find(comment_id)
    CommentMailer.create_comment(user, comment).deliver_later
  end
end
