class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #  Resataurant.all
      #  scope.where(user: user) => only show the list of all Reastaurans's user
      scope.all
    end
  end

  # def new?
  #   true
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   #  if the user is the owner of restaurant => true
  #   #  otherwise => false
  #   #  user => current_user
  #   #  record => @restaurant( argument passed to 'authorize')
  #   # if user == record.user
  #   #   true
  #   # else
  #   #   false
  #   # end
  #     user == record.user
  #   end
    
    def update?
      user_is_owner_or_admin?
    end

    def destroy?
      user_is_owner_or_admin?
    end

    private
    
    def user_is_owner_or_admin?
      user == record.user || user.admin
    end
end
