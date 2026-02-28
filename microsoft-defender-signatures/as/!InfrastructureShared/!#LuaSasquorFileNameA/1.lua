local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1)
L0_1 = L1_1
if L0_1 ~= nil then
  L1_1 = {}
  L1_1["archer.dll"] = ""
  L1_1["archer.dllex.dll"] = ""
  L1_1["gubedzl.dll"] = ""
  L1_1["kitty.dll"] = ""
  L1_1["kyubey.exe"] = ""
  L1_1["lancer.dll"] = ""
  L1_1["qqbrowserframe.dll"] = ""
  L1_1["ppva.dll"] = ""
  L1_1["yacqq.dll"] = ""
  L1_1["yacqq.exe"] = ""
  L2_1 = L1_1[L0_1]
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:SasquorFileName.A"
    L2_1(L3_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
