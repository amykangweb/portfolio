class CommentMailer < ApplicationMailer

  def create_comment(user, comment)
    @user = user
    @article = comment.article
    @url = 'http://www.amykang.net/articles/' + "#{@article.id}"
    @comment = comment.body
    mail(to: "selene6023@gmail.com", from: "portfolio@amykang.net", subject: "New Comment on your Portfolio Site")
  end
end
