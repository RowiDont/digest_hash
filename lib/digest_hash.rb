require 'digest'
require 'active_support/core_ext/hash'

class DigestHash
  def self.call(params)
    new(params).cache_key
  end

  def initialize(params)
    @params = params
  end

  def cache_key
    Digest::MD5.hexdigest(cleaned_params)
  end

  def cleaned_params
    @cleaned_params = @params

    remove_nulls
    deeply_sort_and_stringify_values
    stringify_keys
    sort_and_stringify_hash
  end

  def remove_nulls
    @cleaned_params = @cleaned_params.to_h.delete_if do |_, val|
      val.nil? || val.try(:empty?)
    end
  end

  def deeply_sort_and_stringify_values
    @cleaned_params = @cleaned_params.deep_merge(@cleaned_params) do |_, _, val|
      if val.is_a? Array
        val.sort.to_s
      else
        val.to_s
      end
    end
  end

  def stringify_keys
    @cleaned_params = @cleaned_params.deep_stringify_keys
  end

  def sort_and_stringify_hash
    @cleaned_params = @cleaned_params.sort.to_s
  end
end