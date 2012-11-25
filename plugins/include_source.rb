# Title: Include Code Tag for Jekyll
# Author: Brandon Mathis http://brandonmathis.com
# Description: Import files on your filesystem into any blog post as embedded code snippets with syntax highlighting and a download link.
# Configuration: You can set default import path in _config.yml (defaults to code_dir: downloads/code)
#
# Syntax {% include_code path/to/file %}
#
# Example 1:
# {% include_code javascripts/test.js %}
#
# This will import test.js from source/downloads/code/javascripts/test.js
# and output the contents in a syntax highlighted code block inside a figure,
# with a figcaption listing the file name and download link
#
# Example 2:
# You can also include an optional title for the <figcaption>
#
# {% include_code Example 2 javascripts/test.js %}
#
# will output a figcaption with the title: Example 2 (test.js)
#

require './plugins/pygments_code'
require './plugins/raw'
require 'pathname'

module Jekyll

  class IncludeCodeTag < Liquid::Tag
    include HighlightCode
    include TemplateWrapper
    def initialize(tag_name, markup, tokens)
      @file = nil
      if markup.strip =~ /(\/*\S+) (\S+)/i
        @file = $1
        @section = $2
      end
      super
    end

    def render(context)
      code_dir = (context.registers[:site].config['code_dir'].sub(/^\//,'') || 'downloads/code')
      code_repo = (context.registers[:site].config['code_repo'])
      code_path = (Pathname.new(context.registers[:site].source) + code_dir).expand_path
      file = code_path + @file

      if File.symlink?(code_path)
        return "Code directory '#{code_path}' cannot be a symlink"
      end

      unless file.file?
        return "File #{file} could not be found"
      end

      Dir.chdir(code_path) do
      	code = filter(file, @section)
        @filetype = file.extname.sub('.','') if @filetype.nil?
        title = file.basename
        url = "#{code_repo}/#{@file}"
        source = "<figure class='code'><figcaption><span>#{title}</span> <a href='#{url}'>full</a></figcaption>\n"
        source += "#{highlight(code, @filetype)}</figure>"
        safe_wrap(source)
      end
    end
    
    def filter(file, section)
      on = false
      code = ""
      all = ""
      file.each_line do |line|
        if line.strip == "// </"+section+">"
          on = false
        end
        all += line
        if on
          code += line
        end
        if line.strip == "// <"+section+">"
          on = true
        end
	  end    	
	  if code==""
	  	all
	  else
		code
	  end
    end
  end

end

Liquid::Template.register_tag('include_source', Jekyll::IncludeCodeTag)
