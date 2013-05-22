class PetAuthorizer< ApplicationAuthorizer
  def updatable_by?(user)
    resource.author == user || user.has_role?(:volunteer) || user.has_role?(:admin)
  end

  def deletable_by?(user)
    resource.author == user || user.has_role?(:volunteer) || user.has_role?(:admin)
  end
end
