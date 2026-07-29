import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MaterialBalanceSystem

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure ReactiveBalances {componentSet : Type u} (M : MaterialBalanceSystem) where
  reactionStoichiometry : componentSet -> ℝ
  reactionRate : ℝ
  consumptionRate : componentSet -> ℝ
  productionRate : componentSet -> ℝ
  nonNegativeRates : ∀ (c : componentSet), consumptionRate c ≥ 0 ∧ productionRate c ≥ 0
  generationConsistency : ∀ (c : componentSet), M.reactionGenerationRates c = productionRate c - consumptionRate c
  reactiveBalanceCondition : Prop
  reactiveBalanceClosed : reactiveBalanceCondition

structure ReactiveBalancesEvidence {componentSet : Type u} {M : MaterialBalanceSystem}
    (R : ReactiveBalances M) where
  reactiveBalanceConditionClosed : R.reactiveBalanceCondition

def ReactiveBalancesClosed {componentSet : Type u} {M : MaterialBalanceSystem}
    (R : ReactiveBalances M) : Prop :=
  R.reactiveBalanceCondition

theorem reactive_balances_closed_from_evidence {componentSet : Type u}
    {M : MaterialBalanceSystem} (R : ReactiveBalances M)
    (E : ReactiveBalancesEvidence R) : ReactiveBalancesClosed R := by
  exact E.reactiveBalanceConditionClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse
