# A registry of slugs generated
class SlugRegistry < Hash
  include Singleton
  @registered = false

  def register_complete
    @registered = true
  end

  def all_registered?
    @registered
  end
end

#
# Generates a unique slug (i.e., id name) for something
#
def register_slug(data, group)
  slug = slug_for data
  # Account for overloaded names, e.g.: "hello-world"
  if slug_exists?(slug)
    overload_num = slug[(slug =~ /-\d+$/).to_i + 1..-1].to_i + 1
    slug += "-#{overload_num}" # "hello-world" -> "hello-world-1"
  end
  url = "#{path_for_group group}/\##{slug}"
  merge_data = {}
  # Where does the slug lead to? The url...
  merge_data[slug] = url
  SlugRegistry.instance.merge!(merge_data)
  slug
end

def slug_for(data)
  if data.respond_to? :unique_global_name
    name = data.unique_global_name
  elsif data.is_a?(String)
    name = data
  else
    name = data.name
  end

  name.to_kebab_case
end

def slug_url_for(data)
  SlugRegistry.instance[slug_for data]
end

def slug_exists?(data)
  SlugRegistry.instance.keys.include? slug_for data
end
