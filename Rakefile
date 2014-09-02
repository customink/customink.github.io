require 'rake'
require 'date'
require 'fileutils'
require 'tmpdir'
require 'jekyll'

# == Configuration =============================================================

# Set "rake watch" as default task
task :default => :watch

# Directories
POSTS = '_posts'
DRAFTS = '_drafts'
EXTENSION = 'markdown'

# Templates
POST_TEMPLATE = <<-POST
  ---
  layout: post
  title:
  comments: true
  published: true
  author:
  tags:
  ---

  Excerpt text up to here.

  <!--more-->

  The rest of your post.
POST

PAGE_TEMPLATE = <<-PAGE
  ---
  layout: default
  title:
  ---
PAGE

DATE = Time.now.strftime('%Y-%m-%d')
GITHUB_REPONAME = 'customink.github.io'
GITHUB_BRANCH = 'master'
GITHUB_USER = 'customink'

# == Tasks =============================================================

# rake post['Title']
desc 'Create a post in _posts'
task :post, :title do |t, args|
  title = args[:title]
  check_title(title)
  filename = "#{DATE}-#{transform_to_slug(title, EXTENSION)}"
  create_file(POSTS, filename, POST_TEMPLATE, title)
end

# rake draft['Title']
desc 'Create a post in _drafts'
task :draft, :title do |t, args|
  title = args[:title]
  check_title(title)
  filename = transform_to_slug(title, EXTENSION)
  create_file(DRAFTS, filename, POST_TEMPLATE, title)
end

# rake publish
# rake publish['2014-08-26']
desc 'Move a post from _drafts to _posts'
task :publish, :optional_date do |t, args|
  # set publish date
  date = if args[:optional_date]
    Date.parse(args[:optional_date]).strftime('%Y-%m-%d')
  else
    DATE
  end
  # present list of drafts to choose from
  files = Dir["#{DRAFTS}/*.#{EXTENSION}"]
  files.each_with_index do |file, index|
    puts "#{index + 1}: #{file}".sub("#{DRAFTS}/", '')
  end
  print '> '
  # take user input (draft number to publish)
  # and publish the draft to posts
  number = $stdin.gets
  if number =~ /\D/
    filename = files[number.to_i - 1].sub("#{DRAFTS}/", "")
    FileUtils.mv("#{DRAFTS}/#{filename}", "#{POSTS}/#{date}-#{filename}")
    puts "#{filename} was moved to '#{POSTS}'."
  else
    puts 'Please choose a draft by the assigned number.'
  end
end

# rake page['Title']
desc 'Create a page'
task :page, :title do |t, args|
  filename = 'index.html'
  title = args[:title]
  directory = args[:title]
  check_title(title)
  FileUtils.mkdir_p("#{directory}")
  create_file(directory, filename, PAGE_TEMPLATE, title)
end

# rake build
desc 'Build the site'
task :build do
  system 'jekyll build'
end

# rake watch
# rake watch[number]
# rake watch['drafts']
desc 'Serve and watch the site (with post limit or drafts)'
task :watch, :option do |t, args|
  option = args[:option]
  if option.nil? || option.empty?
    system 'jekyll serve --watch'
  else
    if option == 'drafts'
      system 'jekyll serve --watch --drafts'
    else
      system "jekyll serve --watch --limit_posts #{option}"
    end
  end
end

namespace :production do
  # rake production:preview
  desc 'Launch a preview of the site in the browser'
  task :preview => [:generate] do
    port = 4000
    Thread.new do
      puts 'Launching browser for preview...'
      sleep 3
      system("open http://localhost:#{port}/")
    end
    Rake::Task[:watch].invoke
  end

  # rake production:generate
  desc 'Generate blog files'
  task :generate => [:clean_cache] do
    system 'jekyll build --config _config_production.yml'
  end

  # rake production:clean_cache
  desc 'Clean Sass cache'
  task :clean_cache do
    rm_rf '_cache/assets'
  end

  # rake production:deploy
  # rake production:deploy['commit message']
  desc "Generate and deploy blog to #{GITHUB_BRANCH}"
  task :deploy, [:commit_message] => [:generate] do |t, args|
    commit_message = args[:commit_message] || `git log -1 --pretty=%B`
    sha = `git log`.match(/[a-z0-9]{40}/)[0]
    source_dir = Dir.pwd

    Dir.mktmpdir do |tmp|
      Dir.chdir tmp

      # setup repo in tmp dir
      system 'git init'
      system "git remote add origin git@github.com:#{GITHUB_USER}/#{GITHUB_REPONAME}.git"
      system "git pull origin #{GITHUB_BRANCH}"

      # copy latest production site generation
      cp_r "#{source_dir}/_site/.", tmp
      # prevents github from trying to parse our generated content
      system 'touch .nojekyll'

      # commit and push
      system 'git add .'
      system "git commit -m '#{sha}: #{commit_message}'"
      system "git push origin master:refs/heads/#{GITHUB_BRANCH}"
    end

    Dir.chdir source_dir
    # regenerate _site for dev
    Rake::Task['build'].invoke
  end
end

private

def check_title(title)
  if title.nil? or title.empty?
    raise 'Please add a title to your file.'
  end
end

def transform_to_slug(title, extension)
  characters = /("|'|!|\?|:|\s\z)/
  whitespace = /\s/
  "#{title.gsub(characters,"").gsub(whitespace,"-").downcase}.#{extension}"
end

def write_file(content, title, directory, filename)
  parsed_content = "#{content.sub('title:', "title: \"#{title}\"")}"
  File.write("#{directory}/#{filename}", parsed_content)
  puts "#{filename} was created in '#{directory}'."
end

def create_file(directory, filename, content, title)
  FileUtils.mkdir(directory) unless File.exists?(directory)
  if File.exists?("#{directory}/#{filename}")
    raise 'The file already exists.'
  else
    write_file(content, title, directory, filename)
  end
end
