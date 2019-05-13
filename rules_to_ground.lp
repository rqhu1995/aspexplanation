mr_observation("病人1","mri1","无明显诱因发热","null","null","null","新出现的","1w","1w").
mr_observation("病人1","mri3","咳嗽","null","null","加重","新出现的","1w","1w").
mr_observation("病人1","mri4","咳黄痰","null","null","null","新出现的","1w","1w").
mr_observation("病人1","mri5","胸闷","null","null","null","新出现的","1w","1w").
mr_observation("病人1","mri6","胸持续性酸胀痛","右胸","null","null","新出现的","1w","1w").
mr_observation("病人1","mri7","乏力","null","null","null","新出现的","1w","1w").
mr_observation("病人1","mri22","呼吸音粗","双肺","null","null","新出现的","null","null").
mr_observation("病人1","mri23","湿性啰音","双下肺","null","null","新出现的","null","null").
mr_inspection_conclusion("病人1","mri26","血常规","未见明显异常","null","null","null","null").
mr_inspection_conclusion("病人1","mri27","胸部X线检查","片状浸润性阴影","双下肺","null","null","新出现的").
mr_inspection_data("病人1","mri2","体温","39","℃","新出现的").
mr_inspection_data("病人1","mri9","T","39.4","℃","新出现的").
mr_inspection_data("病人1","mri10","P","120","次/分","新出现的").
mr_inspection_data("病人1","mri11","R","23","次/分","新出现的").
mr_inspection_data("病人1","mri12","BP","124/72","mmHg","新出现的").
mr_disease_history("病人1","mri8","颅脑外伤史","颅脑外伤","null","10y","null").


factor(diseasediagnose1,factor11_1,factor11).
factor(diseasediagnose1,factor12_1,factor12).
factor(diseasediagnose1,factor13_1,factor13).
factor(diseasediagnose1,factor14_1,factor14).
factor(diseasediagnose1,factor15_1,factor15).
factor(diseasediagnose1,factor23_1,factor23).
factor(diseasediagnose1,factor16_1,factor16).
factor(diseasediagnose1,factor17_1,factor17).
factor(diseasediagnose1,factor18_1,factor18).
factor(diseasediagnose1,factor19_1,factor19).
factor(diseasediagnose1,factor20_1,factor20).
factor(diseasediagnose1,factor21_1,factor21).
factor(diseasediagnose1,factor22_1,factor22).


factor_observation(factor11,"咳嗽","null","null","null","新出现的","null","null").
factor_observation(factor12,"咳痰","null","null","null","新出现的","null","null").
factor_observation(factor13,"呼吸道症状","null","null","加重","原有的","null","null").
factor_observation(factor14,"脓性痰","null","null","null","null","null","null").
factor_observation(factor15,"发热","null","null","null","null","null","null").
factor_observation(factor16,"肺实变","肺部","null","null","null","null","null").
factor_observation(factor17,"湿性啰音","肺部","null","null","null","null","null").
factor_inspection_data(factor18,"白细胞数量","0*0^9","null","/L","null").
factor_inspection_data(factor19,"白细胞数量","null","4*0^9","/L","null").
factor_inspection_data(factor23,"体温","38","null","℃","null").
factor_inspectionConclusion(factor20,"胸部X线检查","片状浸润性阴影","肺部","null","null","新出现的").
factor_inspectionConclusion(factor21,"胸部X线检查","斑片状浸润性阴影","肺部","null","null","新出现的").
factor_inspectionConclusion(factor22,"胸部X线检查","间歇性改变","肺部","null","null","新出现的").


logic_and(logic1).
logic_and(logic2).
logic_or(logic3).
logic_or(logic4).
logic_or(logic5).
logic_or(logic6).
logic_or(logic7).
logic_or(logic8).
logic_item(j12_or61).
logic_item(j12_or62).
logic_item(j12_or63).
logic_item(j12_or64).
logic_item(j12_and25).


edge_contains(diseasediagnose1,logic2).
edge_organizes(logic2,j12_and25).
edge_organizes(logic2,logic6).

edge_organizes(j12_and25,logic3).
edge_organizes(logic3,factor20_1).
edge_organizes(logic3,factor21_1).
edge_organizes(logic3,factor22_1).

edge_organizes(logic6,j12_or61).
edge_organizes(logic6,j12_or62).
edge_organizes(logic6,j12_or63).
edge_organizes(logic6,j12_or64).

edge_organizes(j12_or64,logic7).
edge_organizes(logic7,factor18_1).
edge_organizes(logic7,factor19_1).

edge_organizes(j12_or63,logic5).
edge_organizes(logic5,factor16_1).
edge_organizes(logic5,factor17_1).

edge_organizes(j12_or62,logic8).
edge_organizes(logic8,factor15_1).
edge_organizes(logic8,factor23_1).

edge_organizes(j12_or61,logic1).
edge_organizes(logic1,factor14_1).
edge_organizes(logic1,logic4).
edge_organizes(logic4,factor11_1).
edge_organizes(logic4,factor12_1).
edge_organizes(logic4,factor13_1).


equal_to_or_stricter_than(Term_name1,Term_name2):- term(Term_name1),term(Term_name2),Term_name1=Term_name2.
equal_to_or_stricter_than(Term_name1,Term_name2):- term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"is a").
equal_to_or_stricter_than(Term_name1,Term_name2):- term(Term_name1),term(Term_name2),term_relation(Term_name1,Term_name2,"synonym").
equal_to_or_stricter_than(Term_name1,Term_name2):- term(Term_name1),term(Term_name2),Term_name2="null".

less_than_or_equal_to(Value1,Value2):- Value2="null",value(Value1),value(Value2).
less_than_or_equal_to(Value1,Value2):- Value1<= Value2,value(Value1),value(Value2).

greater_than_or_equal_to(Value1,Value2):- Value2="null",value(Value1),value(Value2).
greater_than_or_equal_to(Value1,Value2):- Value1>= Value2,value(Value1),value(Value2).

start(P,MRI_id,Start):- mr_observation(P,MRI_id,Name,Part,Degree,Trend,State,Start,Duration).
start(P,MRI_id,Start):- mr_disease_history(P,MRI_id,Name,Disease_name,Degree,Start,Duration).
start(P,MRI_id,Start):- mr_contact_history(P,MRI_id,Name,Disease_name,Population_name,Degree,Start,Duration).
start(P,MRI_id,Start):- mr_event(P,MRI_id,Name,Manner,Result,Start,Duration,Agent_id,Object_id).



match(P,MRI_id,Local_factor_id):- factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_observation(Factor_id,Name1,Part1,Degree1,Trend1,State1,Duration_min,Duration_max),mr_observation(P,MRI_id,Name2,Part2,Degree2,Trend2,State2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than (Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to (Duration,Duration_min).



match(P,MRI_id,Local_factor_id):- factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspectionConclusion(Factor_id,Name1,Conclusion1,Part1,Degree1,Trend1,State1),mr_inspection_conclusion(P,MRI_id,Name2,Conclusion2,Part2,Degree2,Trend2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than (Degree2,Degree1),equal_to_or_stricter_than(Trend2,Trend1),equal_to_or_stricter_than(State2,State1),equal_to_or_stricter_than(Conclusion2,Conclusion1).


match(P,MRI_id,Local_factor_id):- factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_inspection_data(Factor_id,Name1,Value_min,Value_max,Unit1,State1),mr_inspection_data(P,MRI_id,Name2,Value,Unit2,State2),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Unit2,Unit1),equal_to_or_stricter_than(State2,State1),less_than_or_equal_to(Value,Value_max),greater_than_or_equal_to (Value,Value_min).



match(P,MRI_id,Local_factor_id):- factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_disease_histroy(Factor_id,Name1,Disease_name1,Degree1,Duration_min,Duration_max),mr_disease_histroy(P,MRI_id,Name2,Disease_name2,Degree2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Disease_name2,Disease_name1),equal_to_or_stricter_than (Degree2,Degree1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to (Duration,Duration_min).


match(P,MRI_id,Local_factor_id):- factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_contact_histroy(Factor_id,Name1,Disease_name1,Population_name1,Degree1,Duration_min,Duration_max),mr_contact_histroy(P,MRI_id,Name2,Disease_name2,Population_name2,Degree2,Start,Duration),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Disease_name2,Disease_name1),equal_to_or_stricter_than(Population_name2,Population_name1),equal_to_or_stricter_than (Degree2,Degree1),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to (Duration,Duration_min).


match(P,MRI_id,Local_factor_id):- factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_event(Factor_id,Name1,Manner1,Result1,Duration_min,Duration_max),mr_event(P,MRI_id,Name2,Manner2,Result2,Start,Duration,Agent_id,Object_id),equal_to_or_stricter_than(Name2,Name1),equal_to_or_stricter_than(Manner2,Manner1),equal_to_or_stricter_than(Result2,Result1),patient(P),less_than_or_equal_to(Duration,Duration_max),greater_than_or_equal_to(Duration,Duration_min),edge_agent(Factor_id,V_id1),edge_object(Factor_id,V_id1),match(P,Agent_id,V_id1),match(P,Object_id,V_id2).


-match(P,Local_factor_id):- factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_process(Factor_id,Name),edge_contains(Factor_id,V_id),patient(P),not match(P,V_id).
match(P,Local_factor_id):- factor(DiseaseDiagnose_id,Local_factor_id,Factor_id),factor_process(Factor_id,Name),patient(P),not -match(P,Factor_id).

match(P,Local_factor_id):- match(P,MRI_id,Local_factor_id).



-match(P,Logic_id):- logic_and(Logic_id),edge_organizes(Logic_id,V_id),patient(P),not match(P,V_id).
match(P,Logic_id):- logic_and(Logic_id),patient(P),not -match(P,Logic_id).
match(P,Logic_id):- logic_or(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id).
match(P,Logic_id):- logic_item(Logic_id),edge_organizes(Logic_id,V_id),patient(P),match(P,V_id).
match(P,DiseaseDiagnose_id):- disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),edge_contains(DiseaseDiagnose_id,Logic_id),match(P,Logic_id),patient(P).
match(P,Logic_id):- logic_sequence(Logic_id,Time_min,Time_max),edge_early(Logic_id,V_id1),edge_late(Logic_id,V_id2),match(P,MRI_id1,V_id1),match(P,MRI_id2,V_id2),start(P,MRI_id1,Start1),start(P,MRI_id2,Start2),Start1>=Start2,less_than_or_equal_to(Start1-Start2,Time_max),greater_than_or_equal_to(Start1-Start2,Time_min).

match(P,DiseaseDiagnose_id):- disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text),edge_contains(DiseaseDiagnose_id,Logic_id),match(P,Logic_id),patient(P).
conclude(P,DiseaseDiagnose_id,Disease_name):- match(P,DiseaseDiagnose_id),disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text).
-conclude(P,DiseaseDiagnose_id,Disease_name):- not conclude(P,DiseaseDiagnose_id,Disease_name),patient(P),disease_diagnose(DiseaseDiagnose_id,Disease_name,Disease_icd10,Guideline_text).


term_relation(A,C,"is a"):- term_relation(A,B,"is a"),term_relation(B,C,"is a"),term(A),term(B),term(C).



patient("病人1").


term("null").
term("呼吸音粗").
term("血常规").
term("右胸").
term("左胸").
term("胸部").
term("双肺").
term("双下肺").
term("未见明显异常").
term("无明显诱因发热").
term("咳黄痰").
term("胸持续性酸胀痛").
term("乏力").
term("体温").
term("℃").
term("T").
term("次/分").
term("P").
term("R").
term("BP").
term("mmHg").
term("脉搏").
term("呼吸").
term("血压").
term("颅脑外伤史").
term("颅脑外伤").

value("10y").
value("39").
value("39.4").
value("120").
value("23").
value("124/72").


term("咳嗽").
term("呼吸道症状").
term("脓性痰").
term("白细胞数量").
term("胸部X线检查").
term("片状浸润性阴影").
term("肺部").
term("加重").
term("新出现的").
term("咳痰").
term("原有的").
term("肺实变").
term("发热").
term("湿性啰音").
term("斑片状浸润性阴影").
term("间歇性改变").
term("/L").


value("1w").
value("null").
value("10*10^9").
value("4*10^9").
value("38").



term_relation("T","体温","is a").
term_relation("P","脉搏","is a").
term_relation("R","呼吸","is a").
term_relation("BP","血压","is a").
term_relation("右胸","胸部","is a").
term_relation("左胸","胸部","is a").
term_relation("双肺","肺部","is a").
term_relation("双下肺","肺部","is a").
term_relation("咳黄痰","咳痰","is a").
term_relation("无明显诱因发热","发热","is a").
term_relation("胸持续性酸胀痛","胸痛","is a").
term_relation("咳痰","脓性痰","is a").
term_relation("咳嗽","呼吸道症状","is a").
term_relation("咳痰","呼吸道症状","is a").
term_relation("新出现的","原有的","is a").
disease_diagnose(diseasediagnose1,"社区获得性肺炎",icd10,icd10).
