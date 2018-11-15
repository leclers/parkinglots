class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def edit?
    record.user == user
  end
end
