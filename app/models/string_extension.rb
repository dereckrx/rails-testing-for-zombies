class String
  
  def is_number?
    self =~ /^\d+$/
  end
  
  def humanize
    raise RuntimeError if self =~ /zombie/
    self.downcase.capitalize
  end
  
end
