local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.IOAVGetDownloadUrl
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 20971520 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L2_1 = L2_1(L3_1)
L3_1 = "Lua:Context/SmallRarWithExeAndIoav"
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "Lua:Context/SmallRarWithExeAndIoav"
L4_1(L5_1)
L4_1 = MpCommon
L4_1 = L4_1.QueryPersistContext
L5_1 = L2_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L5_1 = MpCommon
  L5_1 = L5_1.AppendPersistContext
  L6_1 = L2_1
  L7_1 = L3_1
  L8_1 = 300
  L5_1(L6_1, L7_1, L8_1)
end
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "MpDisableCaching"
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
