class Post < ApplicationRecord

  belongs_to :user

  def self.search(search)
    if search
      Post.where("title LIKE :query", query: "%#{search}%")
    else
      Post.all
    end
  end

    validates :title, presence: true,
              length: { minimum: 1 }
    validates :priority, presence: true,
              length: { minimum: 1 }

  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if dueDate.present? && dueDate < Date.today
      errors.add(:dueDate, "can't be in the past")
    end
  end
end
