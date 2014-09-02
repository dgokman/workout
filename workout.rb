class Workout
  attr_reader :id, :exercises

  def initialize(id, workouts)
    @id = id
    @date = workouts[id][:date]
    @exercises = workouts[id][:exercises]
    @type = get_type
    @duration = get_duration
    @calories_burned = get_calories_burned
  end

  def get_type
    strength = 0
    cardio = 0
    other = 0
    @exercises.each do |exercise|
      if exercise[:category] == 'strength'
        strength += 1
      elsif exercise[:category] == 'cardio'
        cardio += 1
      else
        other += 1
      end
    end
    if strength > cardio && strength > other
      return "strength"
    elsif cardio > strength && cardio > other
      return "cardio"
    else
      return "other"
    end
  end

  def get_duration
    duration = 0
    duration_arr = []
    @exercises.each do |exercise|
      duration_arr << exercise[:duration]
    end
    @duration = duration_arr.inject { |total, n| total + n }
  end

  def get_calories_burned
    calories_burned = 0
    @exercises.each do |exercise|
     if exercise[:category] == "cardio" && exercise[:intensity] == "low"
       @calories_burned = exercise[:duration] * 10
     elsif exercise[:category] == "cardio" && exercise[:intensity] == "medium"
       @calories_burned = exercise[:duration] * 8
     elsif exercise[:intensity] == "low"
       @calories_burned = exercise[:duration] * 5
     else
       @calories_burned = exercise[:duration] * 6
     end
    @calories_burned
end
