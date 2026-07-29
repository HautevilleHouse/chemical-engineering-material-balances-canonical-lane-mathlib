import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.AccumulationEquation

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure SteadyStateCondition (S : MaterialBalanceSpecies) (A : AccumulationEquation S) where
  steadyStateAssumption : A.accumulationRate = λ t : ℝ => 0
  steadyStateBalance : ∀ t : ℝ, S.feedRate t = S.outletRate t - S.generationRate t

structure SteadyStateConditionEvidence (S : MaterialBalanceSpecies) (A : AccumulationEquation S) (St : SteadyStateCondition S A) where
  steadyStateAssumptionClosed : St.steadyStateAssumption
  steadyStateBalanceClosed : St.steadyStateBalance

def SteadyStateConditionClosed (S : MaterialBalanceSpecies) (A : AccumulationEquation S) (St : SteadyStateCondition S A) : Prop :=
  St.steadyStateAssumption ∧ St.steadyStateBalance

theorem steady_state_condition_closed_from_evidence (S : MaterialBalanceSpecies) (A : AccumulationEquation S) (St : SteadyStateCondition S A) (E : SteadyStateConditionEvidence S A St) : SteadyStateConditionClosed S A St :=
  And.intro E.steadyStateAssumptionClosed E.steadyStateBalanceClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse