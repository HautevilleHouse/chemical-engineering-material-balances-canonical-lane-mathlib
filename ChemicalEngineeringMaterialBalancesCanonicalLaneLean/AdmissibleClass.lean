import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure ChemicalEngineeringAdmittedObject where
  species : Type
  massBalanceModel : Prop
  reactionStoichiometry : Prop
  phaseEquilibrium : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : ChemicalEngineeringAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse