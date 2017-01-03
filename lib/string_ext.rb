class String
  def method_missing(name, *args)
    colorize(color: name.to_sym)
  end
end
