# !! Apartment
# !!has a number, rent, square footage, number of bedrooms, and number of bathrooms
# !!has many tenants
# !!the list of tenants should not be modified directly
# *****(bonus: actually prevent it from being modified directly)*****
# !!has a method to add a tenant that raises an error if the tenant has a "bad" credit rating, or if the new tenant count would go over the number of bedrooms
# !!has a method to remove a specific tenant either by object reference *or* by name (bonus: do this without checking classes), which raises an error if the tenant is not found
# * !!has a method that removes all tenants
# * !!has an average credit score, calculated from all tenants
# * !!has a credit rating, calculated from the average credit score using the logic below

require_relative 'tenant'

class Apartment

  attr_accessor :number, :rent, :sq_ft, :bedrooms, :baths
  attr_reader :all_tenants

  def initialize(number, rent, sq_ft, bedrooms, baths)
    @number, @rent, @sq_ft, @bedrooms, @baths = number, rent, sq_ft, bedrooms, baths
    @all_tenants = []
  end

  def add_tenant(tenant)
    if tenant.credit_rating == :bad
      raise "Error: Tenant cannot be added: Credit too low"
    end

    if all_tenants.count > bedrooms
      raise "Error: Tenant cannot be added: No occupancy"
    end

    @all_tenants.push(tenant)
  end

  def remove_tenant(tenant)
    if all_tenants.any?
    @all_tenants.delete(tenant)
      # if nil
      #   raise "Error: Tenant cannot be found in Unit #{number}."
      # else
      #   return "Tenant #{tenant} removed successfully."
      # end
    end
  end

  def remove_all
    @all_tenants = []
  end

  def avg_score
    (all_tenants.map(&:credit_score).reduce(0, &:+))/(all_tenants.count)
  end

  def avg_credit_rating
    if avg_score > 759
     :excellent
    elsif avg_score > 725
     :great
    elsif avg_score > 660
     :good
    elsif avg_score > 560
     :mediocre
    else
      :bad
    end
  end

end


















