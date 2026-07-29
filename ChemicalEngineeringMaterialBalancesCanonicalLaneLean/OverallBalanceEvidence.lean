import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.MassTransferPackage
import HautevilleHouse.ChemicalEngineeringMaterialBalancesCanonicalLaneLean.ReactionKineticsPackage

namespace HautevilleHouse
namespace ChemicalEngineeringMaterialBalancesCanonicalLaneLean

structure OverallBalanceEvidence where
  accumulationTerm : Prop
  netFlowTerm : Prop
  reactionGenerationTerm : Prop
  balanceSatisfied : Prop

structure OverallBalanceEvidenceClosed (O : OverallBalanceEvidence) : Prop :=
  accumulationTermClosed : O.accumulationTerm
  netFlowTermClosed : O.netFlowTerm
  reactionGenerationTermClosed : O.reactionGenerationTerm
  balanceSatisfiedClosed : O.balanceSatisfied

def OverallBalanceClosed (O : OverallBalanceEvidence) : Prop :=
  O.accumulationTerm ∧ O.netFlowTerm ∧ O.reactionGenerationTerm ∧ O.balanceSatisfied

theorem overall_balance_closed_from_evidence (O : OverallBalanceEvidence)
    (E : OverallBalanceEvidenceClosed O) : OverallBalanceClosed O :=
by
  exact And.intro E.accumulationTermClosed
    (And.intro E.netFlowTermClosed
      (And.intro E.reactionGenerationTermClosed E.balanceSatisfiedClosed))

end ChemicalEngineeringMaterialBalancesCanonicalLaneLean
end HautevilleHouse