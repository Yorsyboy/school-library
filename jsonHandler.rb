require 'json'

module JsonHandler
  def self.parse_json(json)
    JSON.parse(json)
  end

  def self_generate_json(array)
    JSON.generate(array)
  end
end