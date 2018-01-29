require 'minitest/autorun'
require 'digest_hash'

class DigestHashTest < Minitest::Test
  def test_hash_with_symbols_vs_strings
    hash_a = { hello: 'world', goodbye: 'moon' }
    hash_b = { hello: :world, goodbye: :moon }

    digest_a = DigestHash.call(hash_a)
    digest_b = DigestHash.call(hash_b)

    assert_equal digest_a, digest_b
  end

  def test_hash_with_array_ordering
    hash_a = { hello: 'world', goodbye: [1, 2, 3] }
    hash_b = { hello: 'world', goodbye: [3, 2, 1] }

    digest_a = DigestHash.call(hash_a)
    digest_b = DigestHash.call(hash_b)

    assert_equal digest_a, digest_b
  end

  def test_removes_empty_keys
    hash_a = { hello: '', goodbye: [1, 2, 3] }
    hash_b = { hello: [], goodbye: [3, 2, 1] }

    digest_a = DigestHash.call(hash_a)
    digest_b = DigestHash.call(hash_b)

    assert_equal digest_a, digest_b
  end

  def test_works_with_numbers
    hash_a = { hello: 1, goodbye: '2' }
    hash_b = { hello: '1', goodbye: 2 }

    digest_a = DigestHash.call(hash_a)
    digest_b = DigestHash.call(hash_b)

    assert_equal digest_a, digest_b
  end

  def test_works_with_hashes
    hash_a = { hello: { taco: 'tuesday', nacho: 'wednesday' } }
    hash_b = { hello: { 'taco' => 'tuesday', nacho: 'wednesday' } }

    digest_a = DigestHash.call(hash_a)
    digest_b = DigestHash.call(hash_b)

    assert_equal digest_a, digest_b
  end
end