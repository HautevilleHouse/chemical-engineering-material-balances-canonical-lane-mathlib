import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure MaterialBalanceSpecies where
  speciesName : String
  molecularWeight : ℝ
  initialMoles : ℝ
  feedRate : ℝ → ℝ
  outletRate : ℝ → ℝ
  generationRate : ℝ → ℝ

structure MaterialBalanceEvidence (S : MaterialBalanceSpecies) where
  speciesNameNonempty : S.speciesName ≠ ""
  molecularWeightPositive : S.molecularWeight > 0
  initialMolesNonnegative : S.initialMoles ≥ 0
  feedRateIntegrable : ∀ t : ℝ, S.feedRate t ∈ ℝ
  outletRateIntegrable : ∀ t : ℝ, S.outletRate t ∈ ℝ
  generationRateDefined : ∀ t : ℝ, S.generationRate t ∈ ℝ

def MaterialBalanceClosed (S : MaterialBalanceSpecies) : Prop :=
  S.speciesName ≠ "" ∧ S.molecularWeight > 0 ∧ S.initialMoles ≥ 0 ∧
  (∀ t : ℝ, S.feedRate t ∈ ℝ) ∧ (∀ t : ℝ, S.outletRate t ∈ ℝ) ∧ (∀ t : ℝ, S.generationRate t ∈ ℝ)

theorem material_balance_closed_from_evidence (S : MaterialBalanceSpecies) (E : MaterialBalanceEvidence S) : MaterialBalanceClosed S :=
  And.intro E.speciesNameNonempty
    (And.intro E.molecularWeightPositive
      (And.intro E.initialMolesNonnegative
        (And.intro E.feedRateIntegrable
          (And.intro E.outletRateIntegrable E.generationRateDefined))))

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse