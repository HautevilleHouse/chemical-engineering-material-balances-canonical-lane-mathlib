import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MaterialBalanceSystem

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure MulticomponentDistillation {componentSet : Type u} (M : MaterialBalanceSystem) where
  numberOfStages : ℕ
  feedStage : ℕ
  distillateRate : ℝ
  bottomsRate : ℝ
  refluxRatio : ℝ
  componentRecovery : componentSet -> ℝ
  distillationBalanceCondition : Prop
  distillationBalanceClosed : distillationBalanceCondition

structure MulticomponentDistillationEvidence {componentSet : Type u} {M : MaterialBalanceSystem}
    (D : MulticomponentDistillation M) where
  distillationBalanceConditionClosed : D.distillationBalanceCondition

def MulticomponentDistillationClosed {componentSet : Type u} {M : MaterialBalanceSystem}
    (D : MulticomponentDistillation M) : Prop :=
  D.distillationBalanceCondition

theorem multicomponent_distillation_closed_from_evidence {componentSet : Type u}
    {M : MaterialBalanceSystem} (D : MulticomponentDistillation M)
    (E : MulticomponentDistillationEvidence D) : MulticomponentDistillationClosed D := by
  exact E.distillationBalanceConditionClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse
