# frozen_string_literal: true
#
source_version = ["", "ext/strscan/"].find do |dir|
  begin
    break File.open(File.join(__dir__, "#{dir}strscan.c")) {|f|
      f.gets("\n#define STRSCAN_VERSION ")
      f.gets[/\s*"(.+)"/, 1]
    }
  rescue Errno::ENOENT
  end
end

Gem::Specification.new do |s|
  s.name = "strscan"
  s.version = source_version
  s.summary = "Provides lexical scanning operations on a String."
  s.description = "Provides lexical scanning operations on a String."

  if RUBY_ENGINE == 'jruby'
    s.require_paths = %w{ext/jruby/lib lib}
    s.files = %w{lib/strscan.jar ext/jruby/lib/strscan.rb}
    s.platform = "java"
  else
    s.require_paths = %w{lib}
    s.files = %w{ext/strscan/extconf.rb ext/strscan/strscan.c}
    s.extensions = %w{ext/strscan/extconf.rb}
  end
  s.required_ruby_version = ">= 2.4.0"

  s.authors = ["Minero Aoki", "Sutou Kouhei", "Charles Oliver Nutter"]
  s.email = [nil, "kou@cozmixng.org", "headius@headius.com"]
  s.homepage = "https://github.com/ruby/strscan"
  s.licenses = ["Ruby", "BSD-2-Clause"]
end
