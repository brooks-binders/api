class Binder < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :links

  validates :name, presence: true

  def create_pdf
  end
end
