class CreatePostFromAffirmationService
  def initialize(affirmation)
    @affirmation = affirmation
  end

  def call
    Post.new(owner_id: @affirmation.affirmer_id,
             goal_id: @affirmation.goal_id,
             content: "I want to do this becajse #{@affirmation.reason}")
    .save
  end
end
