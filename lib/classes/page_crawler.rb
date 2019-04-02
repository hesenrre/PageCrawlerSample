require 'open-uri'
 
class PageCrawler
  def process_page(url)
    raise "Invalid URL" if url.blank?
    page = Nokogiri::HTML.parse(open(url))
    {
      url: url,
      content: headers(page),
      links: links(page)
    }
  end
  
  def headers(page)
    page.css("h1,h2,h3").reduce({}) do |res, header| 
      res[header.name.to_sym] ||= []
      res[header.name.to_sym] << header.text
      res
    end
  end
  
  def links(page)
    page.css("a").select{|link| link[:href].present? and link.text.present? }
                 .map{|link| {url: link[:href], text:link.text}}
  end
    
end
