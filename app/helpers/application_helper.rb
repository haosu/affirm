module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def avatar(user)
    render 'shared/avatar', locals: { user: user }
  end

  def progress_bar(progress, total)
    render 'shared/progress_bar',
      percentage: number_to_percentage(progress.to_f/total*100, precision: 2)
  end
end
