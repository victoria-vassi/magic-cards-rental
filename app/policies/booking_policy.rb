class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user
  end

  def update?
    user
  end

  def createmany?
    user
  end

  def edit?
    update?
  end

  def destroy?
    record.user == user
  end
end
