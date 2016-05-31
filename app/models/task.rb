class Task < ActiveRecord::Base
  enum priority: {low: 0, medium: 1, high: 2}
end
