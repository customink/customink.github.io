module StyleBitz

  def self.root
    @root ||= Pathname.new File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
  end

  def self.sass_path
    @sass_path ||= root.join 'app', 'assets', 'stylesheets'
  end

  def self.gem_path(gem_name)
    Gem::Specification.find_all_by_name(gem_name).first.full_gem_path
  end

  def self.gem_sass_path(gem_name, gem_sass_path)
    File.join gem_path(gem_name), gem_sass_path
  end

  def self.register_gem_sass_path(gem_name, gem_sass_path)
    require gem_name
    append_sass_path gem_sass_path(gem_name, gem_sass_path)
  end

  def self.append_sass_path(some_sass_path)
    return unless Dir.exists?(some_sass_path)
    if ENV.has_key?('SASS_PATH')
      path = File::PATH_SEPARATOR + some_sass_path
      ENV['SASS_PATH'] = ENV['SASS_PATH'] + path unless ENV['SASS_PATH'].include?(some_sass_path)
    else
      ENV['SASS_PATH'] = some_sass_path
    end
  end

end
