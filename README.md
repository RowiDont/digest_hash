# digest_hash
[![Build Status](https://travis-ci.org/RowiDont/digest_hash.svg?branch=master)](https://travis-ci.org/RowiDont/digest_hash)

Consistent hash digesting across rails applications:

1. Digests string and symbol keyed hashes to the same digest.
2. Orders arrays
3. Orders the hash keys

### Usage

`gem install digest_hash`

*Application 1* `DigestHash.call({ hello: :mom })` => `"303b53a3a9f1663dcf16b2ad535dee99"`

*Application 2* `DigestHash.call({ 'hello' => 'mom' })` => `"303b53a3a9f1663dcf16b2ad535dee99"`


### Todo

- [ ] Break out hash formatting to individual pre-processor methods
- [ ] Make each pre-processor optional
