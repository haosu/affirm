class GoalMailer < ActionMailer::Base
  default from: 'affirmer@affirm.it'

  def critical_mass_reached(user, goal)
    @goal = goal
    mail to: user.email,
         subject: 'Critical mass reached!'
  end
end
