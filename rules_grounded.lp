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

term("间歇性改变").

equal_to_or_stricter_than("null","null").

equal_to_or_stricter_than("双下肺","双下肺").

equal_to_or_stricter_than("社区获得性肺炎","社区获得性肺炎").

equal_to_or_stricter_than("胸部X线检查","胸部X线检查").

equal_to_or_stricter_than("片状浸润性阴影","片状浸润性阴影").

equal_to_or_stricter_than("斑片状浸润性阴影","斑片状浸润性阴影").

equal_to_or_stricter_than("肺部","肺部").

equal_to_or_stricter_than("新出现的","新出现的").

equal_to_or_stricter_than("肺实变","肺实变").

equal_to_or_stricter_than("发热","发热").

equal_to_or_stricter_than("湿性啰音","湿性啰音").

equal_to_or_stricter_than("间歇性改变","间歇性改变").

equal_to_or_stricter_than("双下肺","肺部").

equal_to_or_stricter_than("双下肺","null").

equal_to_or_stricter_than("社区获得性肺炎","null").

equal_to_or_stricter_than("胸部X线检查","null").

equal_to_or_stricter_than("片状浸润性阴影","null").

equal_to_or_stricter_than("斑片状浸润性阴影","null").

equal_to_or_stricter_than("肺部","null").

equal_to_or_stricter_than("新出现的","null").

equal_to_or_stricter_than("肺实变","null").

equal_to_or_stricter_than("发热","null").

equal_to_or_stricter_than("湿性啰音","null").

equal_to_or_stricter_than("间歇性改变","null").

term_relation("双下肺","肺部","is.

a").

value("null").

less_than_or_equal_to("null","null").

greater_than_or_equal_to("null","null").

mr_observation("病人1","mri23","湿性啰音","双下肺","null","null","新出现的","null","null").

factor_observation(factor16,"肺实变","肺部","null","null","null","null","null").

factor_observation(factor17,"湿性啰音","肺部","null","null","null","null","null").

factor(diseasediagnose1,factor16,factor16).

factor(diseasediagnose1,factor17,factor17).

factor(diseasediagnose1,factor20,factor20).

factor(diseasediagnose1,factor21,factor21).

factor(diseasediagnose1,factor22,factor22).

match("病人1","mri23",factor17).

match("病人1","mri27",factor20).

mr_inspection_conclusion("病人1","mri27","胸部X线检查","片状浸润性阴影","双下肺","null","null","新出现的").

factor_inspectionConclusion(factor20,"胸部X线检查","片状浸润性阴影","肺部","null","null","新出现的").

factor_inspectionConclusion(factor21,"胸部X线检查","斑片状浸润性阴影","肺部","null","null","新出现的").

factor_inspectionConclusion(factor22,"胸部X线检查","间歇性改变","肺部","null","null","新出现的").

match("病人1",factor17).

match("病人1",factor20).

match("病人1",j12_and25).

match("病人1",j12_or63).

match("病人1",logic3).

match("病人1",logic5).

patient("病人1").

edge_organizes(logic2,j12_and25).

edge_organizes(logic2,j12_or63).

edge_organizes(j12_and25,logic3).

edge_organizes(logic3,factor20).

edge_organizes(logic3,factor21).

edge_organizes(logic3,factor22).

edge_organizes(j12_or63,logic5).

edge_organizes(logic5,factor16).

edge_organizes(logic5,factor17).

logic_and(logic2).

logic_or(logic3).

logic_or(logic5).

logic_item(j12_or63).

logic_item(j12_and25).

edge_contains(diseasediagnose1,logic2).

disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null").

greater_than_or_equal_to("null","null") :- value("null"),value("null")),exp("Value1>=Value2".
greater_than_or_equal_to("null","null") :- value("null"),value("null")),exp("Value2=\"null\"".
less_than_or_equal_to("null","null") :- value("null"),value("null")),exp("Value1<=Value2".
less_than_or_equal_to("null","null") :- value("null"),value("null")),exp("Value2=\"null\"".
equal_to_or_stricter_than("null","null") :- term("null"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("双下肺","null") :- term("双下肺"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("社区获得性肺炎","null") :- term("社区获得性肺炎"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("胸部X线检查","null") :- term("胸部X线检查"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("片状浸润性阴影","null") :- term("片状浸润性阴影"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("斑片状浸润性阴影","null") :- term("斑片状浸润性阴影"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("肺部","null") :- term("肺部"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("新出现的","null") :- term("新出现的"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("肺实变","null") :- term("肺实变"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("发热","null") :- term("发热"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("湿性啰音","null") :- term("湿性啰音"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("间歇性改变","null") :- term("间歇性改变"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("null","null") :- term("null"),term("null")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("双下肺","双下肺") :- term("双下肺"),term("双下肺")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("社区获得性肺炎","社区获得性肺炎") :- term("社区获得性肺炎"),term("社区获得性肺炎")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("胸部X线检查","胸部X线检查") :- term("胸部X线检查"),term("胸部X线检查")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("片状浸润性阴影","片状浸润性阴影") :- term("片状浸润性阴影"),term("片状浸润性阴影")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("斑片状浸润性阴影","斑片状浸润性阴影") :- term("斑片状浸润性阴影"),term("斑片状浸润性阴影")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("肺部","肺部") :- term("肺部"),term("肺部")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("新出现的","新出现的") :- term("新出现的"),term("新出现的")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("肺实变","肺实变") :- term("肺实变"),term("肺实变")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("发热","发热") :- term("发热"),term("发热")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("湿性啰音","湿性啰音") :- term("湿性啰音"),term("湿性啰音")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("间歇性改变","间歇性改变") :- term("间歇性改变"),term("间歇性改变")),exp("Term_name1=Term_name2".
match("病人1",j12_or63) :- logic_item(j12_or63),edge_organizes(j12_or63,logic5),patient("病人1"),match("病人1",logic5).
match("病人1",j12_and25) :- logic_item(j12_and25),edge_organizes(j12_and25,logic3),patient("病人1"),match("病人1",logic3).
match("病人1",logic3) :- logic_or(logic3),edge_organizes(logic3,factor20),patient("病人1"),match("病人1",factor20).
match("病人1",logic5) :- logic_or(logic5),edge_organizes(logic5,factor17),patient("病人1"),match("病人1",factor17).
match("病人1",factor17) :- match("病人1","mri23",factor17).
match("病人1",factor20) :- match("病人1","mri27",factor20).
match("病人1","mri27",factor20) :- factor(diseasediagnose1,factor20,factor20),factor_inspectionConclusion(factor20,"胸部X线检查","片状浸润性阴影","肺部","null","null","新出现的"),mr_inspection_conclusion("病人1","mri27","胸部X线检查","片状浸润性阴影","双下肺","null","null","新出现的"),equal_to_or_stricter_than("胸部X线检查","胸部X线检查"),equal_to_or_stricter_than("null","null"),equal_to_or_stricter_than("null","null"),equal_to_or_stricter_than("新出现的","新出现的"),equal_to_or_stricter_than("片状浸润性阴影","片状浸润性阴影").
match("病人1","mri23",factor17) :- factor(diseasediagnose1,factor17,factor17),factor_observation(factor17,"湿性啰音","肺部","null","null","null","null","null"),mr_observation("病人1","mri23","湿性啰音","双下肺","null","null","新出现的","null","null"),equal_to_or_stricter_than("湿性啰音","湿性啰音"),equal_to_or_stricter_than("null","null"),equal_to_or_stricter_than("null","null"),equal_to_or_stricter_than("新出现的","null"),less_than_or_equal_to("null","null"),greater_than_or_equal_to("null","null").
equal_to_or_stricter_than("双下肺","肺部").
a"))).

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
mr_observation("病人1","mri23","湿性啰音","双下肺","null","null","新出现的","null","null").
mr_inspection_conclusion("病人1","mri27","胸部X线检查","片状浸润性阴影","双下肺","null","null","新出现的").
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
a"))).

value("null").
disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null").
match("病人1",logic2).

match("病人1",diseasediagnose1).

conclude("病人1",diseasediagnose1,"社区获得性肺炎") :- match("病人1",diseasediagnose1),disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null").
match("病人1",diseasediagnose1) :- disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null"),edge_contains(diseasediagnose1,logic2),match("病人1",logic2),patient("病人1").
match("病人1",logic2) :- logic_and(logic2),patient("病人1"),not -match("病人1",not logic2).
conclude("病人1",diseasediagnose1,"社区获得性肺炎").

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
term("间歇性改变").
equal_to_or_stricter_than("null","null").
equal_to_or_stricter_than("双下肺","双下肺").
equal_to_or_stricter_than("社区获得性肺炎","社区获得性肺炎").
equal_to_or_stricter_than("胸部X线检查","胸部X线检查").
equal_to_or_stricter_than("片状浸润性阴影","片状浸润性阴影").
equal_to_or_stricter_than("斑片状浸润性阴影","斑片状浸润性阴影").
equal_to_or_stricter_than("肺部","肺部").
equal_to_or_stricter_than("新出现的","新出现的").
equal_to_or_stricter_than("肺实变","肺实变").
equal_to_or_stricter_than("发热","发热").
equal_to_or_stricter_than("湿性啰音","湿性啰音").
equal_to_or_stricter_than("间歇性改变","间歇性改变").
equal_to_or_stricter_than("双下肺","肺部").
equal_to_or_stricter_than("双下肺","null").
equal_to_or_stricter_than("社区获得性肺炎","null").
equal_to_or_stricter_than("胸部X线检查","null").
equal_to_or_stricter_than("片状浸润性阴影","null").
equal_to_or_stricter_than("斑片状浸润性阴影","null").
equal_to_or_stricter_than("肺部","null").
equal_to_or_stricter_than("新出现的","null").
equal_to_or_stricter_than("肺实变","null").
equal_to_or_stricter_than("发热","null").
equal_to_or_stricter_than("湿性啰音","null").
equal_to_or_stricter_than("间歇性改变","null").
term_relation("双下肺","肺部","is.
a").
value("null").
less_than_or_equal_to("null","null").
greater_than_or_equal_to("null","null").
mr_observation("病人1","mri23","湿性啰音","双下肺","null","null","新出现的","null","null").
factor_observation(factor16,"肺实变","肺部","null","null","null","null","null").
factor_observation(factor17,"湿性啰音","肺部","null","null","null","null","null").
factor(diseasediagnose1,factor16,factor16).
factor(diseasediagnose1,factor17,factor17).
factor(diseasediagnose1,factor20,factor20).
factor(diseasediagnose1,factor21,factor21).
factor(diseasediagnose1,factor22,factor22).
match("病人1","mri23",factor17).
match("病人1","mri27",factor20).
mr_inspection_conclusion("病人1","mri27","胸部X线检查","片状浸润性阴影","双下肺","null","null","新出现的").
factor_inspectionConclusion(factor20,"胸部X线检查","片状浸润性阴影","肺部","null","null","新出现的").
factor_inspectionConclusion(factor21,"胸部X线检查","斑片状浸润性阴影","肺部","null","null","新出现的").
factor_inspectionConclusion(factor22,"胸部X线检查","间歇性改变","肺部","null","null","新出现的").
match("病人1",factor17).
match("病人1",factor20).
match("病人1",j12_and25).
match("病人1",j12_or63).
match("病人1",logic3).
match("病人1",logic5).
patient("病人1").
edge_organizes(logic2,j12_and25).
edge_organizes(logic2,j12_or63).
edge_organizes(j12_and25,logic3).
edge_organizes(logic3,factor20).
edge_organizes(logic3,factor21).
edge_organizes(logic3,factor22).
edge_organizes(j12_or63,logic5).
edge_organizes(logic5,factor16).
edge_organizes(logic5,factor17).
logic_and(logic2).
logic_or(logic3).
logic_or(logic5).
logic_item(j12_or63).
logic_item(j12_and25).
edge_contains(diseasediagnose1,logic2).
disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null").
greater_than_or_equal_to("null","null") :- value("null"),value("null")),exp("Value1>=Value2".
greater_than_or_equal_to("null","null") :- value("null"),value("null")),exp("Value2=\"null\"".
less_than_or_equal_to("null","null") :- value("null"),value("null")),exp("Value1<=Value2".
less_than_or_equal_to("null","null") :- value("null"),value("null")),exp("Value2=\"null\"".
equal_to_or_stricter_than("null","null") :- term("null"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("双下肺","null") :- term("双下肺"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("社区获得性肺炎","null") :- term("社区获得性肺炎"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("胸部X线检查","null") :- term("胸部X线检查"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("片状浸润性阴影","null") :- term("片状浸润性阴影"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("斑片状浸润性阴影","null") :- term("斑片状浸润性阴影"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("肺部","null") :- term("肺部"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("新出现的","null") :- term("新出现的"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("肺实变","null") :- term("肺实变"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("发热","null") :- term("发热"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("湿性啰音","null") :- term("湿性啰音"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("间歇性改变","null") :- term("间歇性改变"),term("null")),exp("Term_name2=\"null\"".
equal_to_or_stricter_than("null","null") :- term("null"),term("null")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("双下肺","双下肺") :- term("双下肺"),term("双下肺")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("社区获得性肺炎","社区获得性肺炎") :- term("社区获得性肺炎"),term("社区获得性肺炎")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("胸部X线检查","胸部X线检查") :- term("胸部X线检查"),term("胸部X线检查")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("片状浸润性阴影","片状浸润性阴影") :- term("片状浸润性阴影"),term("片状浸润性阴影")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("斑片状浸润性阴影","斑片状浸润性阴影") :- term("斑片状浸润性阴影"),term("斑片状浸润性阴影")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("肺部","肺部") :- term("肺部"),term("肺部")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("新出现的","新出现的") :- term("新出现的"),term("新出现的")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("肺实变","肺实变") :- term("肺实变"),term("肺实变")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("发热","发热") :- term("发热"),term("发热")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("湿性啰音","湿性啰音") :- term("湿性啰音"),term("湿性啰音")),exp("Term_name1=Term_name2".
equal_to_or_stricter_than("间歇性改变","间歇性改变") :- term("间歇性改变"),term("间歇性改变")),exp("Term_name1=Term_name2".
match("病人1",j12_or63) :- logic_item(j12_or63),edge_organizes(j12_or63,logic5),patient("病人1"),match("病人1",logic5).
match("病人1",j12_and25) :- logic_item(j12_and25),edge_organizes(j12_and25,logic3),patient("病人1"),match("病人1",logic3).
match("病人1",logic3) :- logic_or(logic3),edge_organizes(logic3,factor20),patient("病人1"),match("病人1",factor20).
match("病人1",logic5) :- logic_or(logic5),edge_organizes(logic5,factor17),patient("病人1"),match("病人1",factor17).
match("病人1",factor17) :- match("病人1","mri23",factor17).
match("病人1",factor20) :- match("病人1","mri27",factor20).
match("病人1","mri27",factor20) :- factor(diseasediagnose1,factor20,factor20),factor_inspectionConclusion(factor20,"胸部X线检查","片状浸润性阴影","肺部","null","null","新出现的"),mr_inspection_conclusion("病人1","mri27","胸部X线检查","片状浸润性阴影","双下肺","null","null","新出现的"),equal_to_or_stricter_than("胸部X线检查","胸部X线检查"),equal_to_or_stricter_than("null","null"),equal_to_or_stricter_than("null","null"),equal_to_or_stricter_than("新出现的","新出现的"),equal_to_or_stricter_than("片状浸润性阴影","片状浸润性阴影").
match("病人1","mri23",factor17) :- factor(diseasediagnose1,factor17,factor17),factor_observation(factor17,"湿性啰音","肺部","null","null","null","null","null"),mr_observation("病人1","mri23","湿性啰音","双下肺","null","null","新出现的","null","null"),equal_to_or_stricter_than("湿性啰音","湿性啰音"),equal_to_or_stricter_than("null","null"),equal_to_or_stricter_than("null","null"),equal_to_or_stricter_than("新出现的","null"),less_than_or_equal_to("null","null"),greater_than_or_equal_to("null","null").
equal_to_or_stricter_than("双下肺","肺部").
a"))).
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
mr_observation("病人1","mri23","湿性啰音","双下肺","null","null","新出现的","null","null").
mr_inspection_conclusion("病人1","mri27","胸部X线检查","片状浸润性阴影","双下肺","null","null","新出现的").
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
a"))).
value("null").
disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null").
match("病人1",logic2).
match("病人1",diseasediagnose1).
conclude("病人1",diseasediagnose1,"社区获得性肺炎") :- match("病人1",diseasediagnose1),disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null").
match("病人1",diseasediagnose1) :- disease_diagnose(diseasediagnose1,"社区获得性肺炎","j12","null"),edge_contains(diseasediagnose1,logic2),match("病人1",logic2),patient("病人1").
match("病人1",logic2) :- logic_and(logic2),patient("病人1"),not -match("病人1",not logic2).
conclude("病人1",diseasediagnose1,"社区获得性肺炎").
