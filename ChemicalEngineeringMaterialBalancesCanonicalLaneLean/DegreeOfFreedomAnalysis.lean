import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MaterialBalanceSystem

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure DegreeOfFreedomAnalysis {componentSet : Type u} {M : MaterialBalanceSystem} where
  numberOfVariables : ℕ
  numberOfEquations : ℕ
  degreesOfFreedom : ℕ
  wellSpecifiedCondition : Prop
  degreesOfFreedomComputed : numberOfVariables - numberOfEquations = degreesOfFreedom
  wellSpecifiedClosed : wellSpecifiedCondition

structure DegreeOfFreedomEvidence {componentSet : Type u} {M : MaterialBalanceSystem}
    (D : DegreeOfFreedomAnalysis M) where
  wellSpecifiedClosed : D.wellSpecifiedCondition

def DegreeOfFreedomClosed {componentSet : Type u} {M : MaterialBalanceSystem}
    (D : DegreeOfFreedomAnalysis M) : Prop :=
  D.wellSpecifiedCondition

theorem degree_of_freedom_closed_from_evidence {componentSet : Type u}
    {M : MaterialBalanceSystem} (D : DegreeOfFreedomAnalysis M)
    (E : DegreeOfFreedomEvidence D) : DegreeOfFreedomClosed D := by
  exact E.wellSpecifiedClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse
