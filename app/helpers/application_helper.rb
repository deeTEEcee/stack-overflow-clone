module ApplicationHelper
  def markdown(text)
    options = {
      hard_wrap: true,
      filter_html: true,
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
    }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown.render(text).html_safe # includes highlighting
  end
end
