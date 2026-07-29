import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MaterialBalanceSpecies

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure PhaseEquilibriumBalance (S : MaterialBalanceSpecies) where
  phaseAmounts : ℝ × ℝ
  distributionLaw : ℝ → ℝ
  equilibriumConstant : ℝ
  equalityOfFugacities : Prop

structure PhaseEquilibriumBalanceEvidence (S : MaterialBalanceSpecies) (P : PhaseEquilibriumBalance S) where
  phaseAmountPositive : P.phaseAmounts.1 > 0 ∧ P.phaseAmounts.2 > 0
  distributionLawDefined : ∀ x : ℝ, P.distributionLaw x ∈ ℝ
  equilibriumConstantPositive : P.equilibriumConstant > 0
  equalityOfFugacitiesClosed : P.equalityOfFugacities

def PhaseEquilibriumBalanceClosed (S : MaterialBalanceSpecies) (P : PhaseEquilibriumBalance S) : Prop :=
  (P.phaseAmounts.1 > 0 ∧ P.phaseAmounts.2 > 0) ∧ (∀ x : ℝ, P.distributionLaw x ∈ ℝ) ∧ P.equilibriumConstant > 0 ∧ P.equalityOfFugacities

theorem phase_equilibrium_balance_closed_from_evidence (S : MaterialBalanceSpecies) (P : PhaseEquilibriumBalance S) (E : PhaseEquilibriumBalanceEvidence S P) : PhaseEquilibriumBalanceClosed S P :=
  And.intro E.phaseAmountPositive (And.intro E.distributionLawDefined (And.intro E.equilibriumConstantPositive E.equalityOfFugacitiesClosed))

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse