module UserDecorator
  def name
    "#{properties[:first_name]} #{properties[:last_name]}"
  end
end
