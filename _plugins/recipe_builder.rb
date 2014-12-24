module Jekyll

  class RecipePage < Page
    def initialize(site, base, dir, section, recipe_title, recipe)
      @site = site
      @base = base
      @dir = dir
      puts dir
      @name = recipe_title+'.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'recipe_layout.html')
      self.data['section'] = section
      self.data['recipe'] = recipe
      # category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      self.data['title'] = recipe['title']
    end
  end

  class RecipePageGenerator < Generator
    safe true
    def generate(site)
      directory = site.data['recipes']
      directory.each do |section,value|
        section_metadata = value['metadata']
        value.each do |title,recipe|
          if title != "metadata"
            puts title
            site.pages << RecipePage.new(site, site.source, section, section_metadata,title, recipe)
          end
        end
      end
      # directory.easfda
      # if site.layouts.key? 'category_index'
      #   dir = site.config['category_dir'] || 'categories'
      #   site.categories.each_key do |category|
      #     site.pages << RecipePage.new(site, site.source, File.join(dir, category), category)
      #   end
      # end
    end
  end

end