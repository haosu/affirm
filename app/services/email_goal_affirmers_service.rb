class EmailGoalAffirmersService
  def initialize(goal)
    @goal = goal
  end

  def call
    if @goal.affirmations.count == @goal.critical_mass
      recipients = [@goal.owner] + @goal.affirmers
      recipients.each do |recipient|
        GoalMailer.critical_mass_reached(recipient, @goal).deliver
      end
    end
  end
end
