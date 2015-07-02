class Binder < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :links

  validates :name, presence: true

  def create_pdf_collection
    pdf = CombinePDF.new

    self.links.each do |link|
      link.create_pdf
      pdf << CombinePDF.load(Rails.root.join("public/pdfs/#{link.id}.pdf"))
    end

    output = pdf.save Rails.root.join("public/pdfs/binders/#{self.id}.pdf")

    return true unless !output
  end
end
