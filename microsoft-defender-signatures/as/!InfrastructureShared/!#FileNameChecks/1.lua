local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L1_1["avira.oe.nativecore.dll"] = "AviraOeNativeCoreDll"
L1_1["wsc.dll"] = "AvgWscDll"
L2_1 = L1_1[L0_1]
if L2_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = string
  L4_1 = L4_1.format
  L5_1 = "Lua:FileName%s"
  L6_1 = L2_1
  L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
