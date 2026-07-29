import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MaterialBalanceSystem

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure SingleUnitBalance {componentSet : Type u} (M : MaterialBalanceSystem) where
  unitIdentifier : String
  inletPorts : List String
  outletPorts : List String
  componentInlet : componentSet -> List String -> ℝ
  componentOutlet : componentSet -> List String -> ℝ
  unitBalanceCondition : Prop
  unitBalanceClosed : unitBalanceCondition

structure SingleUnitBalanceEvidence {componentSet : Type u} {M : MaterialBalanceSystem}
    (U : SingleUnitBalance M) where
  unitBalanceConditionClosed : U.unitBalanceCondition

def SingleUnitBalanceClosed {componentSet : Type u} {M : MaterialBalanceSystem}
    (U : SingleUnitBalance M) : Prop :=
  U.unitBalanceCondition

theorem single_unit_balance_closed_from_evidence {componentSet : Type u}
    {M : MaterialBalanceSystem} (U : SingleUnitBalance M)
    (E : SingleUnitBalanceEvidence U) : SingleUnitBalanceClosed U := by
  exact E.unitBalanceConditionClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse
