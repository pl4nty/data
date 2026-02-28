local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L0_1["excel.exe"] = ""
L0_1["windword.exe"] = ""
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1, L3_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1)
L2_1 = L0_1[L1_1]
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
