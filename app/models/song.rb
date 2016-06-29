class Song < ApplicationRecord

  belongs_to :playlist, dependent: :destroy
end
