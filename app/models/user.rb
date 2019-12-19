class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum profile: %i[customer ninja]
  validates :profile, inclusion: { in: profiles.keys }

  def ninja_available?
    return false unless ninja?

    ninja_active_contract.nil?
  end

  def ninja_active_contract
    Contract.where(ninja: self).where(date_finished: nil).first
  end
end
