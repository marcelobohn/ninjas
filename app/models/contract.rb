class Contract < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :ninja, class_name: 'User', optional: true

  enum service_type: %i[espionage murder sabotage]
  validates :service_type, inclusion: { in: service_types.keys }

  def status
    return :open if ninja.nil?
    return :accepted if ninja.present? && date_finished.nil?
    return :finished if rating.nil?

    :rated
  end

  def open?
    status == :open
  end

  def accepted?
    status == :accepted
  end

  def finished?
    status == :finished
  end

  def rated?
    status == :rated
  end

  def ninja_accept(user)
    return false unless open?
    return false unless user.ninja_available?

    update(ninja: user, date_accepted: Time.now)
  end

  def ninja_finish(user)
    return false unless accepted?
    return false if user != ninja

    update(date_finished: Time.now)
  end

  def customer_rating(user, rate)
    return false unless finished?
    return false if user != customer
    return false if rating.present?

    update(rating: rate)
  end
end
