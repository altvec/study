module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selected = array.select do |film|
          !film['country'].nil? &&
            film['country'].split(',').length >= 2 &&
            film['rating_kinopoisk'].to_f.positive?
        end
        ratings = selected.map { |film| film['rating_kinopoisk'].to_f }
        ratings.sum / selected.size
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'] }
             .reduce(0) { |acc, film| acc + film.count('и') }
      end
    end
  end
end
