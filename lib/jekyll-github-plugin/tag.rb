require "jekyll"

# https://jekyllrb.com/docs/plugins/#tags

module JekyllGithubPlugin
  class Tag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @repo = text.strip()
      @repoParts = @repo.split("/")
      @user = @repoParts[0]
      @repository = @repoParts[1]
      @userUrl = "http://github.com/#{@user}"
      @repoUrl = "http://github.com/#{@user}/#{@repository}"
    end

    def render(context)
      result = "<div class='github-box repo' data-repo='#{@repo}'>"
      result << "  <div class='github-box-title'>"
      result << "    <h3><a class='owner' href='#{@userUrl}'>#{@user}</a>/<a class='repo' href='#{@repoUrl}'>#{@repository}</a></h3>"
      result << "    <div class='github-stats'><a class='watchers' href='#{@repoUrl}/watchers'>?</a><a class='forks' href='#{@repoUrl}/network/members'>?</a></div>"
      result << "  </div>"
      result << "  <div class='github-box-content'><p class='description'><span></span> &mdash; <a href='#{@repoUrl}#readme'>Read More</a></p><p class='link'></p></div>"
      result << "  <div class='github-box-download'><p class='updated'>Latest commit to the <strong>master</strong> branch on <span></span></p><a class='download' href='#{@repoUrl}/zipball/master'>Download as zip</a></div>"
      result << "</div>"
      result
    end
  end
end

Liquid::Template.register_tag('github', JekyllGithubPlugin::Tag)
