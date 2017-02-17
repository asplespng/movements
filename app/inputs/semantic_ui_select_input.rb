class SemanticUiSelectInput < SimpleForm::Inputs::CollectionInput
  def input(wrapper_options = nil)
    label_method, value_method = detect_collection_methods
    template.content_tag(:div, class: 'ui selection dropdown') do
      template.concat template.hidden_field_tag("#{@builder.object_name}[#{attribute_name}]")
      # template.concat(@builder.hidden_field(attribute_name))
      template.concat template.content_tag(:i, '', class: 'dropdown icon')
      template.concat template.content_tag(:div, 'Select Author', class: 'default text')
      
      menu = template.content_tag(:div, class: 'menu') do
        collection.each do |item|
          template.concat template.content_tag(:div, item.send(label_method), 'data-value': item.send(value_method), class: 'item')
        end
      end
      template.concat menu
    end
  end
end