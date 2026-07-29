import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MaterialBalanceSpecies

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure ReactionStoichiometryConstraint where
  stoichiometricCoefficients : List (MaterialBalanceSpecies × ℝ)
  reactionRate : ℝ
  extentOfReaction : ℝ → ℝ
  conversionConstraint : Prop

structure ReactionStoichiometryConstraintEvidence (R : ReactionStoichiometryConstraint) where
  coefficientsNonzero : ∀ pair : MaterialBalanceSpecies × ℝ, pair.2 ≠ 0
  reactionRatePositive : R.reactionRate > 0
  extentOfReactionDefined : ∀ t : ℝ, R.extentOfReaction t ∈ ℝ
  conversionConstraintClosed : R.conversionConstraint

def ReactionStoichiometryConstraintClosed (R : ReactionStoichiometryConstraint) : Prop :=
  (∀ pair : MaterialBalanceSpecies × ℝ, pair.2 ≠ 0) ∧ R.reactionRate > 0 ∧ (∀ t : ℝ, R.extentOfReaction t ∈ ℝ) ∧ R.conversionConstraint

theorem reaction_stoichiometry_constraint_closed_from_evidence (R : ReactionStoichiometryConstraint) (E : ReactionStoichiometryConstraintEvidence R) : ReactionStoichiometryConstraintClosed R :=
  And.intro E.coefficientsNonzero (And.intro E.reactionRatePositive (And.intro E.extentOfReactionDefined E.conversionConstraintClosed))

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse