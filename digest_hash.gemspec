Gem::Specification.new do |s|
  s.name        = 'digest_hash'
  s.version     = '0.0.3'
  s.date        = '2018-01-28'
  s.summary     = "Repeatably digest hashes of options with sorted arrays"
  s.description = "Uses MD5 to digest hashes, and deep sorts any arrays, as well as sorts the keys"
  s.authors     = ["Rafi Patel"]
  s.email       = 'rafiepatel@gmail.com'
  s.files       = ["lib/digest_hash.rb"]
  s.homepage    =
    'http://rubygems.org/gems/digest_hash'
  s.license     = 'MIT'

  s.add_runtime_dependency 'activesupport', '>= 4.2'
end