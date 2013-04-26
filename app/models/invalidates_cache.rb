module InvalidatesCache
  extend ActiveSupport::Concern

  included do
    after_create :invalidate_cache

    def invalidate_cache
      Rails.cache.clear
    end
  end
end
