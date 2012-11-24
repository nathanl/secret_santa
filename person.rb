class Person
  attr_accessor :name, :group, :email, :santa

  def to_s
    "#{name} (#{group})"
  end

  def with_santa
    "#{self} - santa: #{santa}"
  end

  def initialize(attrs)
    self.name  = attrs["name"]
    self.group = attrs["group"]
    self.email = attrs["email"]
  end

  def can_be_santa_of?(other)
    group != other.group
  end

  def can_swap_santas_with?(other)
    santa.can_be_santa_of?(other) && other.santa.can_be_santa_of?(self)
  end
end
