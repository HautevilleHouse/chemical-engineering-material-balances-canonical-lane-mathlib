import ChemicalEngineeringMaterialBalancesCanonicalLaneLean.AdmissibleClass
import Mathlib.Analysis.Calculus.ContDiff

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure MassBalancePackage where
  systemBoundary : Type u
  inletStreams : List (Type v)
  outletStreams : List (Type w)
  accumulationTerm : Prop
  generationConsumptionTerm : Prop
  inletOutletSum : Prop

structure MassBalanceEvidence (M : MassBalancePackage) where
  accumulationClosed : M.accumulationTerm
  generationConsumptionClosed : M.generationConsumptionTerm
  inletOutletSumClosed : M.inletOutletSum

def MassBalanceClosed (M : MassBalancePackage) : Prop :=
  M.accumulationTerm ∧ M.generationConsumptionTerm ∧ M.inletOutletSum

theorem mass_balance_closed_from_evidence (M : MassBalancePackage) (E : MassBalanceEvidence M) :
    MassBalanceClosed M := by
  exact And.intro E.accumulationClosed (And.intro E.generationConsumptionClosed E.inletOutletSumClosed)

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse