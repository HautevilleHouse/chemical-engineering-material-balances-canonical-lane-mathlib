import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MaterialProcessNode

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure PhaseEquilibriumPackage where
  temperature : Rat
  pressure : Rat
  phaseFractions : List Rat
  equilibriumConstant : Rat -> Rat

structure PhaseEquilibriumEvidence (P : PhaseEquilibriumPackage) where
  equilibriumConstantClosed : P.equilibriumConstant = (fun _ => 1)
  sumFractionsClosed : P.phaseFractions.sum = 1

def PhaseEquilibriumClosed (P : PhaseEquilibriumPackage) : Prop :=
  P.equilibriumConstant = (fun _ => 1) ∧ P.phaseFractions.sum = 1

theorem phase_equilibrium_closed_from_evidence (P : PhaseEquilibriumPackage)
    (E : PhaseEquilibriumEvidence P) : PhaseEquilibriumClosed P :=
by
  exact And.intro E.equilibriumConstantClosed E.sumFractionsClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse