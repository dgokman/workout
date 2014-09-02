class Workout
  attr_reader :id, :date, :type

  def initialize(id, workouts)
    @id = id
    @date = workouts[id][:date]
    @exercises = workouts[id][:exercises]
    @type = type
    @duration = duration
    @calories_burned = calories_burned
  end

  def type
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

  def duration
    @duration = 0
    @exercises.each do |exercise|
      @duration += exercise[:duration_in_min]
    end
    @duration
  end

  def calories_burned
    @calories_burned = 0
    @exercises.each do |exercise|
     if exercise[:category] == "cardio" && exercise[:intensity] == "high"
       @calories_burned += (exercise[:duration_in_min].to_f * 10)
     elsif exercise[:category] == "cardio" && exercise[:intensity] == "medium"
       @calories_burned += (exercise[:duration_in_min].to_f * 8)
     elsif exercise[:category] == "strength" || exercise[:intensity] == "low"
       @calories_burned += (exercise[:duration_in_min].to_f * 5)
     else
       @calories_burned += (exercise[:duration_in_min].to_f * 6)
     end

    end
  @calories_burned
  end
end
