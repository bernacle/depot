# Whenever we want to abstract some processing out of a view (any kind of view),
# we should write a helper method.
module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
    # This code uses the Rails standard helper, content_tag(),
    # which can be used to wrap the output created by a block in a tag
  end

  def number_to_locale(price)
    price = price * 1.1 if 'es' == I18n.locale.to_s
    number_to_currency price
  end
end
