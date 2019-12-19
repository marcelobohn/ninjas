class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum profile: %i[customer ninja]
  validates :profile, inclusion: { in: profiles.keys }

  scope :available_ninjas, -> { where(profile: :ninja).where.not(id: [ninjas_in_mission.pluck(:ninja_id)]) }

  def ninja_available?
    return false unless ninja?

    ninja_active_contract.nil?
  end

  def ninja_active_contract
    Contract.where(ninja: self).where(date_finished: nil).first
  end

  def self.ninjas_in_mission
    Contract.select('ninja_id').where.not(ninja: nil).where(date_finished: nil).uniq
  end
end
