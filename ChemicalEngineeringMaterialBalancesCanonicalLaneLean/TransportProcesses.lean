import ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MassBalances

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure TransportProcessesPackage {R : ReactionKineticsPackage} (M : MassBalancePackage R) where
  diffusiveFluxes : Prop
  convectiveFluxes : Prop
  boundaryLayerModel : Prop
  transportControlsBalance : Prop

structure TransportProcessesEvidence {R : ReactionKineticsPackage} {M : MassBalancePackage R} (T : TransportProcessesPackage M) where
  diffusiveFluxesClosed : T.diffusiveFluxes
  convectiveFluxesClosed : T.convectiveFluxes
  boundaryLayerModelClosed : T.boundaryLayerModel
  transportControlsBalanceClosed : T.transportControlsBalance

def TransportProcessesClosed {R : ReactionKineticsPackage} {M : MassBalancePackage R} (T : TransportProcessesPackage M) : Prop :=
  T.diffusiveFluxes ∧ T.convectiveFluxes ∧ T.boundaryLayerModel ∧ T.transportControlsBalance

theorem transport_processes_closed_from_evidence {R : ReactionKineticsPackage} {M : MassBalancePackage R} (T : TransportProcessesPackage M) (E : TransportProcessesEvidence T) :
    TransportProcessesClosed T := by
  exact And.intro E.diffusiveFluxesClosed (And.intro E.convectiveFluxesClosed (And.intro E.boundaryLayerModelClosed E.transportControlsBalanceClosed))

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse