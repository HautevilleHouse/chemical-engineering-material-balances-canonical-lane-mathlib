import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure MaterialBalancePackage where
  systemBoundary : Type
  inletStreams : List (String × ℝ)
  outletStreams : List (String × ℝ)
  accumulationRate : ℝ → ℝ
  generationTerm : ℝ → ℝ
  consumptionTerm : ℝ → ℝ
  integralBalance : Prop
  differentialBalance : Prop

structure MaterialBalanceEvidence (M : MaterialBalancePackage) where
  integralBalanceClosed : M.integralBalance
  differentialBalanceClosed : M.differentialBalance

def MaterialBalanceClosed (M : MaterialBalancePackage) : Prop :=
  M.integralBalance ∧ M.differentialBalance

theorem material_balance_closed_from_evidence (M : MaterialBalancePackage)
    (E : MaterialBalanceEvidence M) : MaterialBalanceClosed M := by
  exact And.intro E.integralBalanceClosed E.differentialBalanceClosed

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse