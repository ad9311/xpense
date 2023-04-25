module ApplicationHelper
  def format_value(value)
    number_to_currency value, unit: '$', separator: '.', delimiter: "'", precision: 2
  end

  def format_enum(model_enum)
    model_enum.map { |item| [item[0].titleize, item[0]] }
  end
end
