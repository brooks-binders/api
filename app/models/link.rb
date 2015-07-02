class Link < ActiveRecord::Base
  has_and_belongs_to_many :binders

  validates :url, presence: true

  def create_pdf
    save_name = Time.now.to_i.to_s + ".pdf"

    kit = PDFKit.new(self.url, page_size: "Letter",
                               disable_smart_shrinking: true,
                               disable_external_links: true,
                               disable_internal_links: true,
                               print_media_type: true)
    pdf = kit.to_pdf
    file = kit.to_file(Rails.root.join("public/pdfs/#{save_name}"));
  end
end
