module NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "Post"
      "フォローしている#{notification.notifiable.user.name}さんが#{notification.notifiable.title}を投稿しました"
    when "Relationship"
      "#{notification.notifiable.follower.name}さんにフォローされました"
    when "Comment"
      "投稿した#{notification.notifiable.post.title}が#{notification.notifiable.user.name}さんにコメントされました"
    when "Message"
      "#{notification.notifiable.send_user.name}さんからメッセージが届きました"
    else
      "投稿した#{notification.notifiable.post.title}が#{notification.notifiable.user.name}さんにいいねされました"
    end
  end
end
