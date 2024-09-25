module ItemImgHelper
  def item_img_tag(item, size = :thumb)
    if item.item_img.attached?
      image_tag item.item_img.variant(size)
    end
  end
end
