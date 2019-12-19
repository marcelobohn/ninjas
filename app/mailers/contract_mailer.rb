class ContractMailer < ApplicationMailer
  default from: 'system@example.com'

  def new_contract_to_ninja
    @ninja = params[:ninja]
    mail(to: @ninja.email, subject: 'New contract')
  end

  def contract_accepted
    @customer = params[:customer]
    @contract = params[:contract]
    mail(to: @customer.email, subject: 'Contract accepted')
  end

  def contract_finished
    @customer = params[:customer]
    @contract = params[:contract]
    mail(to: @customer.email, subject: 'Contract finished')
  end
end
