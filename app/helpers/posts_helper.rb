module PostsHelper

  def owner?(post)
    current_user == post.user
  end
end
