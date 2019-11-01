class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    record.user == use
  end

  def new?
    create?
  end

  def create?
    user
  end
end
