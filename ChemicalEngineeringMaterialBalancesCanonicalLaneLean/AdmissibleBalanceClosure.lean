import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.OverallBalanceEvidence

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

open HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | AdmittedProcessObject p => p.conservationClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
by
  rcases A.object with ⟨p, h⟩
  exact h

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
by
  exact A.gateWitness

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse