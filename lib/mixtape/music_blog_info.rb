module Mixtape
  class MusicBlogInfo
    def initialize(url:, tracks_subpath:)
      @url = url
      @tracks_subpath = tracks_subpath
    end

    def lists_links_ids(list_index_subpath)
      list_index_url = @url + list_index_subpath
      metainspector = MetaInspector.new(list_index_url)
      links = metainspector.links.raw
      songs_links = links.select{ |link| link.include? @tracks_subpath }
      songs_links.map{ |link| link.gsub("#{@tracks_subpath}/","") }
    end

    def tracks(page_id:, css_query:)
      complete_url = @url + @tracks_subpath + "/#{page_id}"
      page = Nokogiri::HTML(open complete_url)
      page.css(css_query).map do |node|
        node.content.squeeze(" ").strip
      end
    end
  end
end
