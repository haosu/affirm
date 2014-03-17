Affirm.Views.GoalFormView = Backbone.View.extend({
  events: {
    'input #goal_name': 'showAdditionalInfo'
  },

  initialize: function() {
    this.$additionalInfo = this.$('.goals-form-additional-info');
    this.$additionalInfo.addClass('closed')
  },

  showAdditionalInfo: function() {
    this.$additionalInfo.removeClass('closed')
  }
});
