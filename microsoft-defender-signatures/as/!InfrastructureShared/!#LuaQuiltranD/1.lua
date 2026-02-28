local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
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
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "MpDisableCaching"
L2_1(L3_1)
L2_1 = {}
L3_1 = table
L3_1 = L3_1.insert
L4_1 = L2_1
L5_1 = L0_1
L3_1(L4_1, L5_1)
L3_1 = MpCommon
L3_1 = L3_1.SetPersistContextNoPath
L4_1 = "Lua:MSIL/Quiltran.D"
L5_1 = L2_1
L6_1 = 0
L3_1(L4_1, L5_1, L6_1)
if L0_1 ~= L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESS_PPID
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L4_1 = MpCommon
  L4_1 = L4_1.RequestSmsOnProcess
  L5_1 = L3_1
  L6_1 = MpCommon
  L6_1 = L6_1.SMS_SCAN_MED
  L4_1(L5_1, L6_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
