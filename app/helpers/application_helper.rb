module ApplicationHelper
  def image_tag(img , options={})
    path = "#{Rails.root}/app/assets/images/#{img}"
    img = "missing.png"  unless img.present? and File.file?(path)
    super(img, options)
  end
end
