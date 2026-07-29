import ChemicalEngineeringMaterialBalancesCanonicalLaneLean.PhaseEquilibria

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure ReactionKineticsPackage (P : PhaseEquilibriaPackage) where
  reactionNetwork : Type
  rateLaws : reactionNetwork → ℝ
  stoichiometry : reactionNetwork → List ℕ
  equilibriumConstants : reactionNetwork → ℝ
  rateExpressionsValid : Prop
  stoichiometryConsistent : Prop

structure ReactionKineticsEvidence {P : PhaseEquilibriaPackage} (R : ReactionKineticsPackage P) where
  rateExpressionsValidClosed : R.rateExpressionsValid
  stoichiometryConsistentClosed : R.stoichiometryConsistent

def ReactionKineticsClosed {P : PhaseEquilibriaPackage} (R : ReactionKineticsPackage P) : Prop :=
  R.rateExpressionsValid ∧ R.stoichiometryConsistent

theorem reaction_kinetics_closed_from_evidence {P : PhaseEquilibriaPackage} (R : ReactionKineticsPackage P) (E : ReactionKineticsEvidence R) :
    ReactionKineticsClosed R := by
  exact And.intro E.rateExpressionsValidClosed E.stoichiometryConsistentClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse