class Contract < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :ninja, class_name: 'User', optional: true

  enum service_type: %i[espionage murder sabotage]
  validates :service_type, inclusion: { in: service_types.keys }

  def status
    return :open if ninja.nil?
    return :accepted if ninja.present? && date_finished.nil?

    :finished
  end
end
