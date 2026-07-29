import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure PhaseEquilibriumPackage where
  phases : List String
  componentFugacities : String → ℝ → ℝ
  temperature : ℝ
  pressure : ℝ
  equilibriumCondition : Prop
  phaseRuleConsistency : Prop

structure PhaseEquilibriumEvidence (P : PhaseEquilibriumPackage) where
  equilibriumConditionClosed : P.equilibriumCondition
  phaseRuleConsistencyClosed : P.phaseRuleConsistency

def PhaseEquilibriumClosed (P : PhaseEquilibriumPackage) : Prop :=
  P.equilibriumCondition ∧ P.phaseRuleConsistency

theorem phase_equilibrium_closed_from_evidence (P : PhaseEquilibriumPackage)
    (E : PhaseEquilibriumEvidence P) : PhaseEquilibriumClosed P := by
  exact And.intro E.equilibriumConditionClosed E.phaseRuleConsistencyClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse