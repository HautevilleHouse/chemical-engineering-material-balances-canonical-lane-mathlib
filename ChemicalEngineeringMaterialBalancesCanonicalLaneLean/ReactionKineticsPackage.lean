import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure ReactionKineticsPackage where
  reactionRate : Rat -> Rat
  activationEnergy : Rat
  rateConstant : Rat
  stoichiometry : List (Nat -> Rat)

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  reactionRateClosed : R.reactionRate = (fun _ => 0)
  rateLawClosed : R.rateConstant > 0

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.reactionRate = (fun _ => 0) ∧ R.rateConstant > 0

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage)
    (E : ReactionKineticsEvidence R) : ReactionKineticsClosed R :=
by
  exact And.intro E.reactionRateClosed E.rateLawClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse