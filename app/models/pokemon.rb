class Pokemon < ApplicationRecord
    def link_text
        return "#{number} - #{name}"
    end
end
