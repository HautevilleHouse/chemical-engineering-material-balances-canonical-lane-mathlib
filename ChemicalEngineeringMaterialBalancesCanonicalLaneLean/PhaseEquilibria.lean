import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure PhaseEquilibriaPackage where
  mixture : Type
  phaseBoundaries : Type
  vaporLiquidEquilibrium : Prop
  activityCoefficientModel : Prop
  equilibriumCompositions : Prop
  closureCondition : Prop

structure PhaseEquilibriaEvidence (P : PhaseEquilibriaPackage) where
  vaporLiquidEquilibriumClosed : P.vaporLiquidEquilibrium
  activityCoefficientModelClosed : P.activityCoefficientModel
  equilibriumCompositionsClosed : P.equilibriumCompositions
  closureConditionClosed : P.closureCondition

def PhaseEquilibriaClosed (P : PhaseEquilibriaPackage) : Prop :=
  P.vaporLiquidEquilibrium ∧ P.activityCoefficientModel ∧ P.equilibriumCompositions ∧ P.closureCondition

theorem phase_equilibria_closed_from_evidence (P : PhaseEquilibriaPackage) (E : PhaseEquilibriaEvidence P) :
    PhaseEquilibriaClosed P := by
  exact And.intro E.vaporLiquidEquilibriumClosed (And.intro E.activityCoefficientModelClosed (And.intro E.equilibriumCompositionsClosed E.closureConditionClosed))

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse