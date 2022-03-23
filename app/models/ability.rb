# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
     if user.admin?
       can :manage, :all
     else
      can :update, Post do |post|
          post.user_id == user
      end

      can :read, Post do |post|
        post.user_id == user
      end

      can :destroy, Post do |post|
        post.user_id == user
      end

      can :destroy, Comment do |comment|
        comment.user_id == user
      end

      # can :create, Comment
      # can :create, Post
     end
  end
end
