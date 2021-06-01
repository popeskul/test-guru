class User < ApplicationRecord
    def find_by_level(level)
      Test.where(level: level)
    end
end
