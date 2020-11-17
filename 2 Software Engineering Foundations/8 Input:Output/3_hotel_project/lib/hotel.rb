# frozen_string_literal: true

require_relative 'room'

class Hotel
  def initialize(name, capacities)
    @name = name
    @rooms = {}

    capacities.each do |room_name, capacity|
      @rooms[room_name] = Room.new(capacity)
    end
  end

  def name
    proper_name = @name.split(' ').map(&:capitalize)
    proper_name.join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
      if @rooms[room_name].add_occupant(person)
        print 'check in successful'
      else
        print 'sorry, room is full'
      end
    else
      print 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| room.available_space.positive? }
  end

  def list_rooms
    @rooms.each do |room_name, capacities|
      puts "#{room_name} : #{capacities.available_space}"
    end
  end
end
