# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.pr-labo.net"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-us-east-2.amazonaws.com/#{ENV['AWS_S3_BUCKET']}/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(fog_provider: 'AWS',
  aws_access_key_id: ENV['AWS_S3_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY'],
  fog_directory: ENV['AWS_S3_BUCKET'],
  fog_region: 'us-east-2')


SitemapGenerator::Sitemap.create do
  add root_path

  add npos_path, :priority => 0.7, :changefreq => 'daily' 

  Npo.find_each do |npo|
    add npo_path(npo), lastmod: npo.updated_at
  end

  add companies_path, :priority => 0.7, :changefreq => 'daily' 

  # Company.find_each do |company|
  #   add company_path(company), lastmod: company.updated_at
  # end

  add occupations_path, :priority => 0.7, :changefreq => 'daily' 

  Occupation.find_each do |occupation|
    add occupation_path(occupation), lastmod: occupation.updated_at
  end


  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
