import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.PhaseEquilibriumPackage

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure MassTransferPackage {P : PhaseEquilibriumPackage} where
  drivingForce : Rat -> Rat
  fluxExpression : Rat -> Rat -> Rat
  interfaceEquilibrium : Prop

structure MassTransferEvidence {P : PhaseEquilibriumPackage}
    (M : MassTransferPackage P) where
  drivingForceClosed : M.drivingForce = (fun _ => 0)
  fluxExpressionClosed : M.fluxExpression = (fun _ _ => 0)
  interfaceEquilibriumClosed : M.interfaceEquilibrium

def MassTransferClosed {P : PhaseEquilibriumPackage}
    (M : MassTransferPackage P) : Prop :=
  M.drivingForce = (fun _ => 0) ∧ M.fluxExpression = (fun _ _ => 0) ∧ M.interfaceEquilibrium

theorem mass_transfer_closed_from_evidence {P : PhaseEquilibriumPackage}
    (M : MassTransferPackage P) (E : MassTransferEvidence M) :
    MassTransferClosed M :=
by
  exact And.intro E.drivingForceClosed (And.intro E.fluxExpressionClosed E.interfaceEquilibriumClosed)

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse