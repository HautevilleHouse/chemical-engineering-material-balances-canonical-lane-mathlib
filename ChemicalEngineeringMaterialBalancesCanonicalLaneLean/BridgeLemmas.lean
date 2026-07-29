import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ChemicalEngineeringWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse