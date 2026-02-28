local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == "msiexec.exe" then
  L1_1 = mp
  L1_1 = L1_1.getfilename
  L2_1 = mp
  L2_1 = L2_1.FILEPATH_QUERY_LOWERCASE
  L1_1 = L1_1(L2_1)
  L2_1 = "DllDroppedByMsiexec"
  L3_1 = MpCommon
  L3_1 = L3_1.QueryPersistContext
  L4_1 = L1_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L4_1 = MpCommon
    L4_1 = L4_1.AppendPersistContext
    L5_1 = L1_1
    L6_1 = L2_1
    L7_1 = 100
    L4_1(L5_1, L6_1, L7_1)
  end
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "MpDisableCaching"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
