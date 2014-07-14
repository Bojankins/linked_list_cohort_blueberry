class LinkedListItem
  include Comparable

  attr_accessor :payload, :next_item

  def initialize(payload)
  	@payload = payload
  end

  def next_item=(other_item)
  	@next_item = other_item
  	raise ArgumentError if self == @next_item
  end

  def last?
  	@next_item.nil?
  end

  def <=>(other_item)
    if self.payload.class == other_item.payload.class
        self.payload <=> other_item.payload
    else
      precedence = [ Fixnum, String, Symbol ]
      left = precedence.index(self.payload.class)
      right = precedence.index(other_item.payload.class)
      left <=> right
    end
  end

  def ===(other_item)
    self.equal? other_item
  end
end