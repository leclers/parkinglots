class ParkingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    true
  end

  def edit?
    if record.user == user
      true
    else
      false
    end
  end

  def destroy?
    if record.user == user
      true
    else
      false
    end
  end
end
