class Book < ApplicationRecord
  # @ book = Book.find(params[: id])これを書いたらエラーになった
  validates :title, presence: true
  validates :body, presence: true

end
