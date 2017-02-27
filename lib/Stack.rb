#Stack is like a pared down array that can only use the methods we create for it

class Stack  #implement something = defining how we make that thing (using or invoking is making an instance of that object)
  def initialize
    @store = Array.new
  end

  def push(element)
    @store << element
  end

  def pop
    @store.pop
  end

  def top
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
      # @store.length == 0
      # size == 0 <-- crystal's choice b/c it is the most clear
  end

  def to_s #converts to string so that stack can be printed; just used for inspection
    return @store.to_s #calls the method on the Array
  end
end
