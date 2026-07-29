import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MaterialBalanceSpecies

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure AccumulationEquation (S : MaterialBalanceSpecies) where
  totalMoles : ℝ → ℝ
  accumulationRate : ℝ → ℝ
  differentialEquation : Prop
  initialCondition : S.initialMoles = totalMoles 0
  closureCondition : ∀ t : ℝ, accumulationRate t = S.feedRate t - S.outletRate t + S.generationRate t

structure AccumulationEquationEvidence (S : MaterialBalanceSpecies) (A : AccumulationEquation S) where
  differentialEquationClosed : A.differentialEquation
  initialConditionClosed : A.initialCondition
  closureConditionClosed : A.closureCondition

def AccumulationEquationClosed (S : MaterialBalanceSpecies) (A : AccumulationEquation S) : Prop :=
  A.differentialEquation ∧ A.initialCondition ∧ A.closureCondition

theorem accumulation_equation_closed_from_evidence (S : MaterialBalanceSpecies) (A : AccumulationEquation S) (E : AccumulationEquationEvidence S A) : AccumulationEquationClosed S A :=
  And.intro E.differentialEquationClosed (And.intro E.initialConditionClosed E.closureConditionClosed)

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse