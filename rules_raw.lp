factor(diseasediagnose1,factor16,factor16).
factor(diseasediagnose1,factor17,factor17).
factor(diseasediagnose1,factor20,factor20).
factor(diseasediagnose1,factor21,factor21).
factor(diseasediagnose1,factor22,factor22).
factor_observation(factor16,"肺实变","肺部","null","null","null","null","null").
factor_observation(factor17,"湿性啰音","肺部","null","null","null","null","null").
factor_inspectionConclusion(factor20,"胸部X线检查","片状浸润性阴影","肺部","null","null","新出现的").
factor_inspectionConclusion(factor21,"胸部X线检查","斑片状浸润性阴影","肺部","null","null","新出现的").
factor_inspectionConclusion(factor22,"胸部X线检查","间歇性改变","肺部","null","null","新出现的").
disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null").
logic_and(logic2).
logic_or(logic3).
logic_or(logic5).
logic_item(j12_or63).
logic_item(j12_and25).
edge_contains(diseasediagnose1,logic2).
edge_organizes(logic2,j12_and25).
edge_organizes(logic2,j12_or63).
edge_organizes(j12_and25,logic3).
edge_organizes(logic3,factor20).
edge_organizes(logic3,factor21).
edge_organizes(logic3,factor22).
edge_organizes(j12_or63,logic5).
edge_organizes(logic5,factor16).
edge_organizes(logic5,factor17).
mr_observation("病人1", "mri23", "湿性啰音", "双下肺", "null", "null", "新出现的", "null", "null").
mr_inspection_conclusion("病人1", "mri27", "胸部X线检查", "片状浸润性阴影", "双下肺", "null", "null", "新出现的").
patient("病人1").
term("null").
term("双下肺").
term("社区获得性肺炎").
term("胸部X线检查").
term("片状浸润性阴影").
term("斑片状浸润性阴影").
term("肺部").
term("新出现的").
term("肺实变").
term("发热").
term("湿性啰音").
term("斑片状浸润性阴影").
term("间歇性改变").
term_relation("双下肺","肺部","is a").
value("null").
equal_to_or_stricter_than(Term_name1,Term_name2):- term(Term_name1),term(Term_name2), Term_name1=Term_name2.
equal_to_or_stricter_than(Term_name1,Term_name2):- term(Term_name1),term(Term_name2), term_relation(Term_name1,Term_name2,"is a").
equal_to_or_stricter_than(Term_name1,Term_name2):- term(Term_name1),term(Term_name2), term_relation(Term_name1,Term_name2,"synonym").
equal_to_or_stricter_than(Term_name1,Term_name2):- term(Term_name1),term(Term_name2),Term_name2="null".
less_than_or_equal_to(Value1,Value2):- Value2="null",value(Value1),value(Value2).
less_than_or_equal_to(Value1,Value2):- Value1<= Value2,value(Value1),value(Value2).
greater_than_or_equal_to(Value1,Value2):- Value2="null",value(Value1),value(Value2).
greater_than_or_equal_to(Value1,Value2):- Value1>= Value2,value(Value1),value(Value2).
match(P, MRI_id,Local_factor_id):- factor(DiseaseDiagnose_id, Local_factor_id, Factor_id),factor_observation(Factor_id, Name1, Part1, Degree1, Trend1, State1, Duration_min, Duration_max), mr_observation(P, MRI_id, Name2, Part2, Degree2, Trend2, State2, Start, Duration), equal_to_or_stricter_than(Name2, Name1), equal_to_or_stricter_than (Degree2, Degree1),equal_to_or_stricter_than(Trend2, Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration, Duration_max),greater_than_or_equal_to (Duration, Duration_min).
match(P, MRI_id,Local_factor_id):- factor(DiseaseDiagnose_id, Local_factor_id, Factor_id),factor_inspectionConclusion(Factor_id, Name1, Conclusion1, Part1, Degree1,Trend1, State1), mr_inspection_conclusion(P, MRI_id, Name2,Conclusion2, Part2, Degree2, Trend2, State2),equal_to_or_stricter_than(Name2, Name1), equal_to_or_stricter_than (Degree2, Degree1),equal_to_or_stricter_than(Trend2, Trend1), equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1).
match(P, Local_factor_id):- match(P, MRI_id, Local_factor_id).
-match(P,Logic_id):- logic_and(Logic_id),edge_organizes(Logic_id, V_id),patient(P),not match(P, V_id).
match(P,Logic_id):- logic_and(Logic_id),patient(P),not -match(P,Logic_id).
match(P,Logic_id):- logic_or(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id).
match(P,Logic_id):- logic_item(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id).
match(P,DiseaseDiagnose_id):- disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),edge_contains(DiseaseDiagnose_id,Logic_id),match(P,Logic_id),patient(P).
conclude(P,DiseaseDiagnose_id,Disease_name):- match(P,DiseaseDiagnose_id),disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text).
term_relation(A,C,"is a"):- term_relation(A,B,"is a"),term_relation(B,C,"is a"),term(A),term(B),term(C).
disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null").
applicable(0,h(factor(diseasediagnose1,factor16,factor16))).
applicable(1,h(factor(diseasediagnose1,factor17,factor17))).
applicable(2,h(factor(diseasediagnose1,factor20,factor20))).
applicable(3,h(factor(diseasediagnose1,factor21,factor21))).
applicable(4,h(factor(diseasediagnose1,factor22,factor22))).
applicable(5,h(factor_observation(factor16,"肺实变","肺部","null","null","null","null","null"))).
applicable(6,h(factor_observation(factor17,"湿性啰音","肺部","null","null","null","null","null"))).
applicable(7,h(factor_inspectionConclusion(factor20,"胸部X线检查","片状浸润性阴影","肺部","null","null","新出现的"))).
applicable(8,h(factor_inspectionConclusion(factor21,"胸部X线检查","斑片状浸润性阴影","肺部","null","null","新出现的"))).
applicable(9,h(factor_inspectionConclusion(factor22,"胸部X线检查","间歇性改变","肺部","null","null","新出现的"))).
applicable(10,h(disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null"))).
applicable(11,h(logic_and(logic2))).
applicable(12,h(logic_or(logic3))).
applicable(13,h(logic_or(logic5))).
applicable(14,h(logic_item(j12_or63))).
applicable(15,h(logic_item(j12_and25))).
applicable(16,h(edge_contains(diseasediagnose1,logic2))).
applicable(17,h(edge_organizes(logic2,j12_and25))).
applicable(18,h(edge_organizes(logic2,j12_or63))).
applicable(19,h(edge_organizes(j12_and25,logic3))).
applicable(20,h(edge_organizes(logic3,factor20))).
applicable(21,h(edge_organizes(logic3,factor21))).
applicable(22,h(edge_organizes(logic3,factor22))).
applicable(23,h(edge_organizes(j12_or63,logic5))).
applicable(24,h(edge_organizes(logic5,factor16))).
applicable(25,h(edge_organizes(logic5,factor17))).
applicable(26,h(mr_observation("病人1","mri23","湿性啰音","双下肺","null","null","新出现的","null","null"))).
applicable(27,h(mr_inspection_conclusion("病人1","mri27","胸部X线检查","片状浸润性阴影","双下肺","null","null","新出现的"))).
applicable(28,h(patient("病人1"))).
applicable(29,h(term("null"))).
applicable(30,h(term("双下肺"))).
applicable(31,h(term("社区获得性肺炎"))).
applicable(32,h(term("胸部X线检查"))).
applicable(33,h(term("片状浸润性阴影"))).
applicable(34,h(term("斑片状浸润性阴影"))).
applicable(35,h(term("肺部"))).
applicable(36,h(term("新出现的"))).
applicable(37,h(term("肺实变"))).
applicable(38,h(term("发热"))).
applicable(39,h(term("湿性啰音"))).
applicable(40,h(term("斑片状浸润性阴影"))).
applicable(41,h(term("间歇性改变"))).
applicable(42,h(term_relation("双下肺","肺部","is a"))).
applicable(43,h(value("null"))).
applicable(44,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2)),exp("Term_name1=Term_name2")):- term(Term_name1),term(Term_name2),Term_name1=Term_name2.
blocked(44,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2)),exp("Term_name1=Term_name2")) :- not term(Term_name1),var(Term_name2),var(Term_name1).
blocked(44,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2)),exp("Term_name1=Term_name2")) :- not term(Term_name2),var(Term_name2),var(Term_name1).
blocked(44,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2)),exp("Term_name1=Term_name2")) :- Term_name1!=Term_name2,var(Term_name2),var(Term_name1).
applicable(45,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"is a"))):- term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"is a").
blocked(45,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"is a"))) :- not term(Term_name1),var(Term_name2),var(Term_name1).
blocked(45,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"is a"))) :- not term(Term_name2),var(Term_name2),var(Term_name1).
blocked(45,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"is a"))) :- not term_relation(Term_name1,Term_name2,"is a"),var(Term_name2),var(Term_name1).
applicable(46,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"synonym"))):- term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"synonym").
blocked(46,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"synonym"))) :- not term(Term_name1),var(Term_name2),var(Term_name1).
blocked(46,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"synonym"))) :- not term(Term_name2),var(Term_name2),var(Term_name1).
blocked(46,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"synonym"))) :- not term_relation(Term_name1,Term_name2,"synonym"),var(Term_name2),var(Term_name1).
applicable(47,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2)),exp("Term_name2=\"null\"")):- term(Term_name1),term(Term_name2),Term_name2="null".
blocked(47,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2)),exp("Term_name2=\"null\"")) :- not term(Term_name1),var(Term_name2),var(Term_name1).
blocked(47,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2)),exp("Term_name2=\"null\"")) :- not term(Term_name2),var(Term_name2),var(Term_name1).
blocked(47,h(equal_to_or_stricter_than(Term_name1,Term_name2)),pB(term(Term_name1),term(Term_name2)),exp("Term_name2=\"null\"")) :- Term_name2!="null",var(Term_name2),var(Term_name1).
applicable(48,h(less_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value2=\"null\"")):- value(Value1),value(Value2),Value2="null".
blocked(48,h(less_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value2=\"null\"")) :- not value(Value1),var(Value1),var(Value2).
blocked(48,h(less_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value2=\"null\"")) :- not value(Value2),var(Value1),var(Value2).
blocked(48,h(less_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value2=\"null\"")) :- Value2!="null",var(Value1),var(Value2).
applicable(49,h(less_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value1<=Value2")):- value(Value1),value(Value2),Value1<=Value2.
blocked(49,h(less_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value1<=Value2")) :- not value(Value1),var(Value1),var(Value2).
blocked(49,h(less_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value1<=Value2")) :- not value(Value2),var(Value1),var(Value2).
blocked(49,h(less_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value1<=Value2")) :- Value1>Value2,var(Value1),var(Value2).
applicable(50,h(greater_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value2=\"null\"")):- value(Value1),value(Value2),Value2="null".
blocked(50,h(greater_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value2=\"null\"")) :- not value(Value1),var(Value1),var(Value2).
blocked(50,h(greater_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value2=\"null\"")) :- not value(Value2),var(Value1),var(Value2).
blocked(50,h(greater_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value2=\"null\"")) :- Value2!="null",var(Value1),var(Value2).
applicable(51,h(greater_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value1>=Value2")):- value(Value1),value(Value2),Value1>=Value2.
blocked(51,h(greater_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value1>=Value2")) :- not value(Value1),var(Value1),var(Value2).
blocked(51,h(greater_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value1>=Value2")) :- not value(Value2),var(Value1),var(Value2).
blocked(51,h(greater_than_or_equal_to(Value1,Value2)),pB(value(Value1),value(Value2)),exp("Value1>=Value2")) :- Value1<Value2,var(Value1),var(Value2).
applicable(52,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min))):- factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min).
blocked(52,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min))) :- not factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),var(DiseaseDiagnose_id),var(Degree2),var(Start),var(Degree1),var(Duration_max),var(Part2),var(Duration),var(Part1),var(P),var(State1),var(State2),var(Duration_min),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(52,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min))) :- not factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),var(DiseaseDiagnose_id),var(Degree2),var(Start),var(Degree1),var(Duration_max),var(Part2),var(Duration),var(Part1),var(P),var(State1),var(State2),var(Duration_min),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(52,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min))) :- not mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),var(DiseaseDiagnose_id),var(Degree2),var(Start),var(Degree1),var(Duration_max),var(Part2),var(Duration),var(Part1),var(P),var(State1),var(State2),var(Duration_min),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(52,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min))) :- not equal_to_or_stricter_than(Name2,Name1),var(DiseaseDiagnose_id),var(Degree2),var(Start),var(Degree1),var(Duration_max),var(Part2),var(Duration),var(Part1),var(P),var(State1),var(State2),var(Duration_min),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(52,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min))) :- not equal_to_or_stricter_than(Degree2,Degree1),var(DiseaseDiagnose_id),var(Degree2),var(Start),var(Degree1),var(Duration_max),var(Part2),var(Duration),var(Part1),var(P),var(State1),var(State2),var(Duration_min),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(52,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min))) :- not equal_to_or_stricter_than(Trend2,Trend1),var(DiseaseDiagnose_id),var(Degree2),var(Start),var(Degree1),var(Duration_max),var(Part2),var(Duration),var(Part1),var(P),var(State1),var(State2),var(Duration_min),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(52,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min))) :- not equal_to_or_stricter_than(State2,State1),var(DiseaseDiagnose_id),var(Degree2),var(Start),var(Degree1),var(Duration_max),var(Part2),var(Duration),var(Part1),var(P),var(State1),var(State2),var(Duration_min),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(52,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min))) :- not less_than_or_equal_to(Duration,Duration_max),var(DiseaseDiagnose_id),var(Degree2),var(Start),var(Degree1),var(Duration_max),var(Part2),var(Duration),var(Part1),var(P),var(State1),var(State2),var(Duration_min),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(52,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min))) :- not greater_than_or_equal_to(Duration,Duration_min),var(DiseaseDiagnose_id),var(Degree2),var(Start),var(Degree1),var(Duration_max),var(Part2),var(Duration),var(Part1),var(P),var(State1),var(State2),var(Duration_min),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
applicable(53,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1))):- factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1).
blocked(53,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1))) :- not factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),var(DiseaseDiagnose_id),var(Degree2),var(Degree1),var(Part2),var(Part1),var(Conclusion1),var(Conclusion2),var(P),var(State1),var(State2),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(53,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1))) :- not factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),var(DiseaseDiagnose_id),var(Degree2),var(Degree1),var(Part2),var(Part1),var(Conclusion1),var(Conclusion2),var(P),var(State1),var(State2),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(53,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1))) :- not mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),var(DiseaseDiagnose_id),var(Degree2),var(Degree1),var(Part2),var(Part1),var(Conclusion1),var(Conclusion2),var(P),var(State1),var(State2),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(53,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1))) :- not equal_to_or_stricter_than(Name2,Name1),var(DiseaseDiagnose_id),var(Degree2),var(Degree1),var(Part2),var(Part1),var(Conclusion1),var(Conclusion2),var(P),var(State1),var(State2),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(53,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1))) :- not equal_to_or_stricter_than(Degree2,Degree1),var(DiseaseDiagnose_id),var(Degree2),var(Degree1),var(Part2),var(Part1),var(Conclusion1),var(Conclusion2),var(P),var(State1),var(State2),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(53,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1))) :- not equal_to_or_stricter_than(Trend2,Trend1),var(DiseaseDiagnose_id),var(Degree2),var(Degree1),var(Part2),var(Part1),var(Conclusion1),var(Conclusion2),var(P),var(State1),var(State2),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(53,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1))) :- not equal_to_or_stricter_than(State2,State1),var(DiseaseDiagnose_id),var(Degree2),var(Degree1),var(Part2),var(Part1),var(Conclusion1),var(Conclusion2),var(P),var(State1),var(State2),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
blocked(53,h(match(P,MRI_id,Local_factor_id)),pB(factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1))) :- not equal_to_or_stricter_than(Conclusion2,Conclusion1),var(DiseaseDiagnose_id),var(Degree2),var(Degree1),var(Part2),var(Part1),var(Conclusion1),var(Conclusion2),var(P),var(State1),var(State2),var(Trend2),var(Trend1),var(MRI_id),var(Name1),var(Local_factor_id),var(Factor_id),var(Name2).
applicable(54,h(match(P,Local_factor_id)),pB(match(P,MRI_id,Local_factor_id))):- match(P,MRI_id,Local_factor_id).
blocked(54,h(match(P,Local_factor_id)),pB(match(P,MRI_id,Local_factor_id))) :- not match(P,MRI_id,Local_factor_id),var(P),var(MRI_id),var(Local_factor_id).
applicable(55,h(-match(P,Logic_id)),pB(logic_and(Logic_id),edge_organizes(Logic_id,V_id),patient(P)),nB(match(P,V_id))):- logic_and(Logic_id),edge_organizes(Logic_id,V_id),patient(P),not match(P,V_id).
blocked(55,h(-match(P,Logic_id)),pB(logic_and(Logic_id),edge_organizes(Logic_id,V_id),patient(P)),nB(match(P,V_id))) :- not logic_and(Logic_id),var(P),var(Logic_id),var(V_id).
blocked(55,h(-match(P,Logic_id)),pB(logic_and(Logic_id),edge_organizes(Logic_id,V_id),patient(P)),nB(match(P,V_id))) :- not edge_organizes(Logic_id,V_id),var(P),var(Logic_id),var(V_id).
blocked(55,h(-match(P,Logic_id)),pB(logic_and(Logic_id),edge_organizes(Logic_id,V_id),patient(P)),nB(match(P,V_id))) :- not patient(P),var(P),var(Logic_id),var(V_id).
blocked(55,h(-match(P,Logic_id)),pB(logic_and(Logic_id),edge_organizes(Logic_id,V_id),patient(P)),nB(match(P,V_id))) :- match(P,V_id),var(P),var(Logic_id),var(V_id).
applicable(56,h(match(P,Logic_id)),pB(logic_and(Logic_id),patient(P)),nB(-match(P,Logic_id))):- logic_and(Logic_id),patient(P),not -match(P,Logic_id).
blocked(56,h(match(P,Logic_id)),pB(logic_and(Logic_id),patient(P)),nB(-match(P,Logic_id))) :- not logic_and(Logic_id),var(P),var(Logic_id).
blocked(56,h(match(P,Logic_id)),pB(logic_and(Logic_id),patient(P)),nB(-match(P,Logic_id))) :- not patient(P),var(P),var(Logic_id).
blocked(56,h(match(P,Logic_id)),pB(logic_and(Logic_id),patient(P)),nB(-match(P,Logic_id))) :- -match(P,Logic_id),var(P),var(Logic_id).
applicable(57,h(match(P,Logic_id)),pB(logic_or(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id))):- logic_or(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id).
blocked(57,h(match(P,Logic_id)),pB(logic_or(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id))) :- not logic_or(Logic_id),var(P),var(Logic_id),var(V_id).
blocked(57,h(match(P,Logic_id)),pB(logic_or(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id))) :- not edge_organizes(Logic_id,V_id),var(P),var(Logic_id),var(V_id).
blocked(57,h(match(P,Logic_id)),pB(logic_or(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id))) :- not patient(P),var(P),var(Logic_id),var(V_id).
blocked(57,h(match(P,Logic_id)),pB(logic_or(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id))) :- not match(P,V_id),var(P),var(Logic_id),var(V_id).
applicable(58,h(match(P,Logic_id)),pB(logic_item(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id))):- logic_item(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id).
blocked(58,h(match(P,Logic_id)),pB(logic_item(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id))) :- not logic_item(Logic_id),var(P),var(Logic_id),var(V_id).
blocked(58,h(match(P,Logic_id)),pB(logic_item(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id))) :- not edge_organizes(Logic_id,V_id),var(P),var(Logic_id),var(V_id).
blocked(58,h(match(P,Logic_id)),pB(logic_item(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id))) :- not patient(P),var(P),var(Logic_id),var(V_id).
blocked(58,h(match(P,Logic_id)),pB(logic_item(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id))) :- not match(P,V_id),var(P),var(Logic_id),var(V_id).
applicable(59,h(match(P,DiseaseDiagnose_id)),pB(disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),edge_contains(DiseaseDiagnose_id,Logic_id),match(P,Logic_id),patient(P))):- disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),edge_contains(DiseaseDiagnose_id,Logic_id),match(P,Logic_id),patient(P).
blocked(59,h(match(P,DiseaseDiagnose_id)),pB(disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),edge_contains(DiseaseDiagnose_id,Logic_id),match(P,Logic_id),patient(P))) :- not disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),var(P),var(DiseaseDiagnose_id),var(Logic_id),var(Disease_icd10),var(Disease_name),var(Guideline_text).
blocked(59,h(match(P,DiseaseDiagnose_id)),pB(disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),edge_contains(DiseaseDiagnose_id,Logic_id),match(P,Logic_id),patient(P))) :- not edge_contains(DiseaseDiagnose_id,Logic_id),var(P),var(DiseaseDiagnose_id),var(Logic_id),var(Disease_icd10),var(Disease_name),var(Guideline_text).
blocked(59,h(match(P,DiseaseDiagnose_id)),pB(disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),edge_contains(DiseaseDiagnose_id,Logic_id),match(P,Logic_id),patient(P))) :- not match(P,Logic_id),var(P),var(DiseaseDiagnose_id),var(Logic_id),var(Disease_icd10),var(Disease_name),var(Guideline_text).
blocked(59,h(match(P,DiseaseDiagnose_id)),pB(disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),edge_contains(DiseaseDiagnose_id,Logic_id),match(P,Logic_id),patient(P))) :- not patient(P),var(P),var(DiseaseDiagnose_id),var(Logic_id),var(Disease_icd10),var(Disease_name),var(Guideline_text).
applicable(60,h(conclude(P,DiseaseDiagnose_id,Disease_name)),pB(match(P,DiseaseDiagnose_id),disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text))):- match(P,DiseaseDiagnose_id),disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text).
blocked(60,h(conclude(P,DiseaseDiagnose_id,Disease_name)),pB(match(P,DiseaseDiagnose_id),disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text))) :- not match(P,DiseaseDiagnose_id),var(P),var(DiseaseDiagnose_id),var(Disease_icd10),var(Disease_name),var(Guideline_text).
blocked(60,h(conclude(P,DiseaseDiagnose_id,Disease_name)),pB(match(P,DiseaseDiagnose_id),disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text))) :- not disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),var(P),var(DiseaseDiagnose_id),var(Disease_icd10),var(Disease_name),var(Guideline_text).
applicable(61,h(term_relation(A,C,"is a")),pB(term_relation(A,B,"is a"),term_relation(B,C,"is a"),term(A),term(B),term(C))):- term_relation(A,B,"is a"),term_relation(B,C,"is a"),term(A),term(B),term(C).
blocked(61,h(term_relation(A,C,"is a")),pB(term_relation(A,B,"is a"),term_relation(B,C,"is a"),term(A),term(B),term(C))) :- not term_relation(A,B,"is a"),var(A),var(B),var(C).
blocked(61,h(term_relation(A,C,"is a")),pB(term_relation(A,B,"is a"),term_relation(B,C,"is a"),term(A),term(B),term(C))) :- not term_relation(B,C,"is a"),var(A),var(B),var(C).
blocked(61,h(term_relation(A,C,"is a")),pB(term_relation(A,B,"is a"),term_relation(B,C,"is a"),term(A),term(B),term(C))) :- not term(A),var(A),var(B),var(C).
blocked(61,h(term_relation(A,C,"is a")),pB(term_relation(A,B,"is a"),term_relation(B,C,"is a"),term(A),term(B),term(C))) :- not term(B),var(A),var(B),var(C).
blocked(61,h(term_relation(A,C,"is a")),pB(term_relation(A,B,"is a"),term_relation(B,C,"is a"),term(A),term(B),term(C))) :- not term(C),var(A),var(B),var(C).
applicable(62,h(disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null"))).
