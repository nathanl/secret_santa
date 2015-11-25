class Person
  attr_accessor :name, :group, :email, :phone, :santa

  def initialize(attrs)
    self.name  = attrs["name"]
    self.group = attrs["group"]
    self.email = attrs["email"]
    self.phone = attrs["phone"]
  end

  def can_be_santa_of?(other)
    group != other.group
  end

  def can_swap_santas_with?(other)
    santa.can_be_santa_of?(other) && other.santa.can_be_santa_of?(self)
  end

  def to_s
    "#{name} (#{group})"
  end

  def with_santa
    "#{self} - santa: #{santa}"
  end

end
