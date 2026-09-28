# jekyll-cache-bust's bust_css_cache hashes assets/_sass, but this site keeps its Sass
# in _sass/, so main.css always got the same ?v= (the MD5 of nothing) and browsers kept
# serving a stale stylesheet after style changes. Hash the real Sass directory instead.
module Jekyll
  module CacheBust
    def bust_css_cache(file_name)
      CacheDigester.new(file_name: file_name, directory: '_sass').digest!
    end
  end
end
