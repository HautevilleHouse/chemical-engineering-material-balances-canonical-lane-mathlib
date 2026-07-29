import ChemicalEngineeringMaterialBalancesCanonicalLaneLean.ReactionKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure MassBalancePackage (R : ReactionKineticsPackage) where
  speciesSet : Type
  inflowRates : speciesSet → ℝ
  outflowRates : speciesSet → ℝ
  accumulation : speciesSet → ℝ
  reactionTerms : speciesSet → ℝ
  overallBalance : Prop
  componentBalances : Prop
  balanceClosureCondition : Prop

structure MassBalanceEvidence {R : ReactionKineticsPackage} (M : MassBalancePackage R) where
  overallBalanceClosed : M.overallBalance
  componentBalancesClosed : M.componentBalances
  balanceClosureConditionClosed : M.balanceClosureCondition

def MassBalanceClosed {R : ReactionKineticsPackage} (M : MassBalancePackage R) : Prop :=
  M.overallBalance ∧ M.componentBalances ∧ M.balanceClosureCondition

theorem mass_balance_closed_from_evidence {R : ReactionKineticsPackage} (M : MassBalancePackage R) (E : MassBalanceEvidence M) :
    MassBalanceClosed M := by
  exact And.intro E.overallBalanceClosed (And.intro E.componentBalancesClosed E.balanceClosureConditionClosed)

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse