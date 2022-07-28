# frozen_string_literal: true

require 'pry-byebug'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    value = Node.new(value)
    if @head.nil?
      @head = value
    else
      @tail.next_node = value
    end
    @tail = value
  end

  def prepend(value)
    novo = Node.new(value)
    novo.next_node = @head
    @head = novo
  end

  def size(current_node = @head, counter = 1)
    return counter if current_node.next_node.nil? == true

    size(current_node.next_node, counter + 1)
  end

  def head(current_node = @head)
    current_node
  end

  def tail(current_node = @head)
    return current_node if current_node.next_node.nil? == true

    tail(current_node.next_node)
  end

  def at(index, current_node = @head, counter = 1)
    return current_node if counter == index

    at(index, current_node.next_node, counter + 1)
  end

  def pop(current_node = @head)
    # chegar no penultimo
    if current_node.next_node == @tail
      current_node.next_node = nil
      @tail = current_node
    else
      pop(current_node.next_node)

    end
    # determinar que o next value = nil
    # determinar que o penultimo = tail
  end

  def contains?(value, current_node = @head)
    return true if current_node.value == value

    current_node.next_node.nil? ? false : contains?(value, current_node.next_node)
  end

  def to_s(current_node = @head, sentence = "(#{current_node.value}) -> ")
    if current_node != @tail
      to_s(current_node.next_node, sentence + "(#{current_node.next_node.value}) -> ")
    else
      "#{sentence}nil"
    end
  end

  def insert_at(value, index, _current_node = @head)
    previous_node = at(index - 1)
    working_node = at(index)
    previous_node.next_node = Node.new(value)
    previous_node.next_node.next_node = working_node
  end

  def remove_at(index)
    previous_node = at(index - 1)
    working_node = at(index + 1)
    previous_node.next_node = working_node
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end

  attr_reader :value, :next_node
end

p1 = LinkedList.new

p1.append('olá')

# puts p1.size

# puts p1.head

p1.prepend('byee')

# puts p1.head

# puts p1.size
p1.prepend('byee')

p1.prepend('car')
# puts p1.head
# puts p1.tail.value

p1.prepend('duuuu')
puts p1.at(2)

# puts p1.size
# puts p1.tail.value

p1.append('olá')
p p1.tail.value

# puts p1.size
# puts p1.tail.value

p1.append('olá')
p1.append('bah')
p p1.tail.value

# puts p1.size
p1.append('tche')
p p1.tail.value

p p1.contains?('bah')

p1.pop
p p1.contains?('tche')

p1.tail.value
p p1.tail.value

p1.prepend('derp')

p1.append('herpederp')

p p1.contains?('puta que o pariu marquinhos')

p p1.to_s

p1.insert_at('us guri', 4)
p p1.to_s

p1.insert_at('malditos milicos', 7)
p p1.to_s

p1.remove_at(4)
p p1.to_s

# puts p1.at(5).value

# puts p1.head
# puts p1.tail.value
