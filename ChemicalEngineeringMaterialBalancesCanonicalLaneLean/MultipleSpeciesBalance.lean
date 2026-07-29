import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MaterialBalanceSpecies

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure MultipleSpeciesBalance where
  speciesList : List MaterialBalanceSpecies
  overallAccumulation : Prop
  overallBalance : Prop
  independenceAssumption : Prop

structure MultipleSpeciesBalanceEvidence (M : MultipleSpeciesBalance) where
  speciesListNonempty : M.speciesList ≠ []
  overallAccumulationClosed : M.overallAccumulation
  overallBalanceClosed : M.overallBalance
  independenceAssumptionClosed : M.independenceAssumption

def MultipleSpeciesBalanceClosed (M : MultipleSpeciesBalance) : Prop :=
  M.speciesList ≠ [] ∧ M.overallAccumulation ∧ M.overallBalance ∧ M.independenceAssumption

theorem multiple_species_balance_closed_from_evidence (M : MultipleSpeciesBalance) (E : MultipleSpeciesBalanceEvidence M) : MultipleSpeciesBalanceClosed M :=
  And.intro E.speciesListNonempty (And.intro E.overallAccumulationClosed (And.intro E.overallBalanceClosed E.independenceAssumptionClosed))

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse