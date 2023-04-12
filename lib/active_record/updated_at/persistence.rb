module ActiveRecord
  module UpdatedAt
    module Persistence
      def update_columns(attributes, &block)
        attribute_exists = attribute_names.include?("updated_at")
        already_specified = Array(attributes).flatten.grep(/\bupdated_at\b/).any?
        enabled = UpdatedAt.enabled?
        updated_at = Time.current

        if attribute_exists && !already_specified && enabled
          attributes[:updated_at] = updated_at
        end

        super
      end
    end
  end
end
