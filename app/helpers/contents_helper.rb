module ContentsHelper

  # Returns a string for the id attribute of a html element for the given content
  def content_dom_id(content)
    return "" if content.nil?
    if content.class == String
      c = Content.find_by_name(content)
      return "" if c.nil?
    else
      c = content
    end
    "#{c.essence_type.underscore}_#{c.id}"
  end

  # Renders the name of elements content or the default name defined in elements.yml
  def render_content_name(content)
    if content.blank?
      warning('Element is nil')
      return ""
    else
      content_name = content.name_for_label
    end
    if content.description.blank?
      warning("Content #{content.name} is missing its description")
      title = _("Warning: Content '%{contentname}' is missing its description.") % {:contentname => content.name}
      content_name = %(<span class="warning icon" title="#{title}"></span>&nbsp;) + content_name
    end
    content.has_validations? ? "#{content_name}<span class='validation_indicator'>*</span>" : content_name
  end

  # Renders a link to show the new content overlay
  def render_new_content_link(element)
    link_to_overlay_window(
      _('add new content'),
      new_admin_element_content_path(element),
      {
        :size => '305x40',
        :title => _('Select an content'),
        :overflow => true
      },
      {
        :id => "add_content_for_element_#{element.id}",
        :class => 'button new_content_link'
      }
    )
  end

  # Renders a link to create a new content in element editor
  def render_create_content_link(element, options = {})
    defaults = {
      :label => _('add new content')
    }
    options = defaults.merge(options)
    link_to(
      options[:label],
      admin_contents_path(
        :content => {
          :name => options[:content_name],
          :element_id => element.id
        }
      ),
      :method => 'post',
      :remote => true,
      :id => "add_content_for_element_#{element.id}",
      :class => 'button new_content_link'
    )
  end

end