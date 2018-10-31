class Task < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user

  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 100 }

  #タスクにいいねする
  def iine(user)
    likes.create(user_id: user.id)
  end

  #タスクのいいねを解除する
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

  #現在のユーザーがいいねしていたらTrue返す
  def iine?(user)
    iine_users.include?(user)
  end

  #現在のタスクが完了済みだったらTrue返す
  def done?(task)
    task.done
  end

end
