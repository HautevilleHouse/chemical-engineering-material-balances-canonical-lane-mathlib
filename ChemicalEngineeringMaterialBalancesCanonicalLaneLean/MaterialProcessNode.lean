import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure MaterialProcessNode where
  speciesCount : Nat
  streamFlows : List (Nat → Rat)
  balances : List (Rat → Prop)
  conservationLaw : Prop

structure AdmittedProcessObject where
  node : MaterialProcessNode
  conservationClosed : node.conservationLaw

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse