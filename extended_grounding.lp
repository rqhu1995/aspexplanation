{match(P,V_id):factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_process(Factor_id,Name),edge_contains(Factor_id,V_id),patient(P)}.
{-match(P,Factor_id):factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_process(Factor_id,Name),patient(P)}.
{match(P,V_id):logic_and(Logic_id),edge_organizes(Logic_id,V_id),patient(P)}.
{-match(P,Logic_id):logic_and(Logic_id),patient(P)}.
{conclude(P,DiseaseDiagnose_id,Disease_name):patient(P),disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text)}.
