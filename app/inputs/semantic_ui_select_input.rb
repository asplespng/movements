class SemanticUiSelectInput < SimpleForm::Inputs::CollectionInput
  def input(wrapper_options = nil)
    label_method, value_method = detect_collection_methods
    classes = [:ui,:selection, :dropdown]
    classes << :multiple if options[:multiple]
    classes << :search if  options[:search]
    input_html_options[:class] = input_html_options[:class] | classes
    template.content_tag(:div, input_html_options) do
      template.concat(@builder.hidden_field(attribute_name))
      template.concat template.content_tag(:i, '', class: 'dropdown icon')
      template.concat template.content_tag(:div, options[:prompt], class: 'default text')
      
      menu = template.content_tag(:div, class: 'menu') do
        template.concat template.content_tag(:div, ' ', class: 'item') unless options[:include_blank] == false || options[:multiple] == true
        collection.each do |item|
          template.concat template.content_tag(:div, item.send(label_method), 'data-value': item.send(value_method), class: 'item')
        end
      end
      template.concat menu
    end
  end
end