import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MaterialBalanceSystem

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure SteadyStateBalance {componentSet : Type u} (M : MaterialBalanceSystem) where
  totalAccumulationZero : M.accumulationRates = λ _ => 0
  componentAccumulationZero : ∀ (c : componentSet), M.accumulationRates c = 0
  steadyStateCondition : Prop
  steadyStateClosed : steadyStateCondition

structure SteadyStateEvidence {componentSet : Type u} {M : MaterialBalanceSystem}
    (S : SteadyStateBalance M) where
  steadyStateConditionClosed : S.steadyStateCondition

def SteadyStateClosed {componentSet : Type u} {M : MaterialBalanceSystem}
    (S : SteadyStateBalance M) : Prop :=
  S.steadyStateCondition

theorem steady_state_closed_from_evidence {componentSet : Type u}
    {M : MaterialBalanceSystem} (S : SteadyStateBalance M)
    (E : SteadyStateEvidence S) : SteadyStateClosed S := by
  exact E.steadyStateConditionClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse
