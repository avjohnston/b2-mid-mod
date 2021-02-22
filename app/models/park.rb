class Park < ApplicationRecord
  has_many :rides

  def admission_fix
    '%.2f' % self.admission
  end
end
