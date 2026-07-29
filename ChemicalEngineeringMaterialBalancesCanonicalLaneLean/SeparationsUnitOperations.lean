import ChemicalEngineeringMaterialBalancesCanonicalLaneLean.ReactionKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure SeparationsUnitOperationsPackage where
  operationType : String
  feedConditions : Prop
  productSpecifications : Prop
  stageEquilibrium : Prop
  materialBalancePerStage : Prop

structure SeparationsUnitOperationsEvidence (S : SeparationsUnitOperationsPackage) where
  feedConditionsClosed : S.feedConditions
  productSpecificationsClosed : S.productSpecifications
  stageEquilibriumClosed : S.stageEquilibrium
  materialBalancePerStageClosed : S.materialBalancePerStage

def SeparationsUnitOperationsClosed (S : SeparationsUnitOperationsPackage) : Prop :=
  S.feedConditions ∧ S.productSpecifications ∧ S.stageEquilibrium ∧ S.materialBalancePerStage

theorem separations_unit_operations_closed_from_evidence (S : SeparationsUnitOperationsPackage) (E : SeparationsUnitOperationsEvidence S) :
    SeparationsUnitOperationsClosed S := by
  exact And.intro E.feedConditionsClosed (And.intro E.productSpecificationsClosed (And.intro E.stageEquilibriumClosed E.materialBalancePerStageClosed))

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse