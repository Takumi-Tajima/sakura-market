module ItemImgHelper
  def item_img_tag(item, size = :thumb)
    image_tag item.item_img.variant(size)
  end
end
