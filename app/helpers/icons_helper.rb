module IconsHelper
  def edit_icon(object, link_text = nil)
    edit_icon_filename = 'page_edit.png'
    link_to image_tag(edit_icon_filename) + " " + link_text,
            edit_polymorphic_path(object)
  end

  def delete_icon(object, link_text = nil)
    delete_icon_filename = 'cancel.png'
    link_to image_tag(delete_icon_filename) + " " + link_text,
            polymorphic_path(object),
            :method => :delete,
            :confirm => "Delete '#{object}'?"
  end
end
