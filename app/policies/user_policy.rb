class UserPolicy
  attr_reader :current_user, :record

  def initialize(current_user, record)
    @current_user = current_user
    @record = record
  end

  def destroy?
    @current_user.rank == 1
  end
end
