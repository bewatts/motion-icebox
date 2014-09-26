Gem::Specification.new do |spec|
  spec.name = 'motion-icebox'
  spec.summary = 'Motion Icebox'
  spec.description = 'Motion Icebox - A way to save your objects for later inspection'
  spec.authors = ["Ben Watts", "justalisteningman"]
  spec.email = 'ben@benjaminclaywatts.com'
  spec.homepage = "http://rubymotionquery.com"
  spec.version = '0.1.1'
  spec.license = 'MIT'

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files = files
  spec.require_paths = ["lib"]
end