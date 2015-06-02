require 'yaml'

#RAILS_ENV = Rails.env


class FixtureConverter

  class << self
    def read_fixture(source)
      if FileTest.file?(source)
        read_fixture_yml(source)
      elsif FileTest.directory?(source)
        read_fixture_dir(source)
      else
        raise 'invalid'
      end
    end

    def read_fixture_yml(source_file)
      YAML.load_file(source_file).values
    end

    def read_fixture_dir(source_dir)
      Dir.glob("#{source_dir}/*.yml").map do |file|
        read_fixture_yml(file)
      end.flatten.compact
    end

  end

end

class SeedLoader
  def initialize(args)
    
  end
end

#puts FixtureConverter.read_fixture_yml("../db/seeds/test_models.yml").flatten.compact
puts FixtureConverter.read_fixture_dir("../db/seeds")

#is_expired = true
unless true
  is_expired = 1 < 3 
end

print is_expired
