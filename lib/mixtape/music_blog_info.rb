module Mixtape
  class MusicBlogInfo
    def initialize(options)
      @url = options[:url]
      @tracks_subpath = options[:tracks_subpath]
    end

    def lists_links_ids(list_index_subpath)
      list_index_url = @url + list_index_subpath
      metainspector = MetaInspector.new(list_index_url)
      links = metainspector.links.raw
      songs_links = links.select{ |link| link.include? @tracks_subpath }
      songs_links.map{ |link| link.gsub("#{@tracks_subpath}/","") }
    end

    def tracks(options)
      complete_url = @url + @tracks_subpath + "/#{options[:page_id]}"
      page = Nokogiri::HTML(open complete_url)
      page.css(options[:css_query]).map do |node|
        node.content.squeeze(" ").strip
      end
    end
  end
end
