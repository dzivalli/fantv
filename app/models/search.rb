require 'net/http'

class Search

  def initialize(text)
    @text = text
  end

  def result
    raw_data = get_json('/search/multi', query: @text)
    if raw_data.code == '200'
      @data = JSON.parse raw_data.body
      parse
    end
  end

  private

  def get_json(path, params = {})
    uri = URI.parse("http://api.themoviedb.org/3#{path}")
    uri.query = {
        api_key: '7b5e30851a9285340e78c201c4e4ab99'
    }.merge!(params).to_query

    Net::HTTP.get_response(uri)
  end

  def parse
    hash = { movies: [],
             shows: [],
             people: [],
             total_results: @data['total_results'] }

    @data['results'].each do |result|
      case result['media_type']
        when 'movie'
          hash[:movies] << {name: result['title'],
                            photo: photo_url(result['poster_path']),
                            year: get_year(result['release_date'])}
        when 'tv'
          hash[:shows] << {name: result['name'],
                           photo: photo_url(result['poster_path']),
                           year: years_for_tv(result['id'])}
        when 'person'
          hash[:people] << {name: result['name'],
                            photo: photo_url(result['profile_path']),
                            year: ''}
      end
    end

    hash
  end

  def get_year(date)
    date.is_a?(String) ? date.scan(/^(\d{4})/)[0][0] : ''
  end

  def years_for_tv(id)
    raw_data = get_json("/tv/#{id}")
    if raw_data.code == '200'
      tv_info = JSON.parse raw_data.body
      first = get_year(tv_info['first_air_date'])
      last = get_year(tv_info['last_air_date'])
      first.empty? && last.empty? ? '' : "#{first} - #{last}"
    end
  end

  def photo_url(path)
    if path =~ /.jpg$/
      "http://image.tmdb.org/t/p/w92#{path}"
    else
      'default.png'
    end
  end
end