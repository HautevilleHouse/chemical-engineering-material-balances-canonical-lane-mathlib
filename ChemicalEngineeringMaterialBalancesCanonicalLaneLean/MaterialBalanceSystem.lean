import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure MaterialBalanceSystem where
  processStreams : Type u
  componentSet : Type v
  inletFlowRates : componentSet -> processStreams -> ℝ
  outletFlowRates : componentSet -> processStreams -> ℝ
  accumulationRates : componentSet -> ℝ
  reactionGenerationRates : componentSet -> ℝ
  totalMassBalance : Prop
  componentMassBalance : componentSet -> Prop
  totalMassBalanceClosed : totalMassBalance
  componentMassBalanceClosed : ∀ (c : componentSet), componentMassBalance c

structure MaterialBalanceEvidence (M : MaterialBalanceSystem) where
  totalMassBalanceClosed : M.totalMassBalance
  componentMassBalanceClosed : ∀ (c : M.componentSet), M.componentMassBalance c

def MaterialBalanceClosed (M : MaterialBalanceSystem) : Prop :=
  M.totalMassBalance ∧ ∀ (c : M.componentSet), M.componentMassBalance c

theorem material_balance_closed_from_evidence (M : MaterialBalanceSystem)
    (E : MaterialBalanceEvidence M) : MaterialBalanceClosed M := by
  exact And.intro E.totalMassBalanceClosed E.componentMassBalanceClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse
