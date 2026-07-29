import ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MassBalanceEquations

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure PhaseEquilibriumPackage where
  components : List Type u
  temperature : Type v
  pressure : Type w
  fugacityEquality : Prop
  raoultsLawApplicable : Prop
  kValueCorrelation : Prop

structure PhaseEquilibriumEvidence (P : PhaseEquilibriumPackage) where
  fugacityEqualityClosed : P.fugacityEquality
  raoultsLawApplicableClosed : P.raoultsLawApplicable
  kValueCorrelationClosed : P.kValueCorrelation

def PhaseEquilibriumClosed (P : PhaseEquilibriumPackage) : Prop :=
  P.fugacityEquality ∧ P.raoultsLawApplicable ∧ P.kValueCorrelation

theorem phase_equilibrium_closed_from_evidence (P : PhaseEquilibriumPackage) (E : PhaseEquilibriumEvidence P) :
    PhaseEquilibriumClosed P := by
  exact And.intro E.fugacityEqualityClosed (And.intro E.raoultsLawApplicableClosed E.kValueCorrelationClosed)

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse