class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_and_belongs_to_many :authors, dependent: :destroy
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    before_validation :capatalize_title

    private
    def capatalize_title
        self.title=title.upcase
    end
end
