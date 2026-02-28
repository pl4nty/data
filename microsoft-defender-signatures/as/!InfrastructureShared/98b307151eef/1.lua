local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = MpCommon
L0_1 = L0_1.GetPersistContextNoPath
L1_1 = "EmailCollection"
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = {}
  L0_1 = L1_1
  L1_1 = table
  L1_1 = L1_1.insert
  L2_1 = L0_1
  L3_1 = "1"
  L1_1(L2_1, L3_1)
  L1_1 = MpCommon
  L1_1 = L1_1.SetPersistContextNoPath
  L2_1 = "EmailCollection"
  L3_1 = L0_1
  L4_1 = 60
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = tonumber
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L1_1 = L7_1
end
L1_1 = L1_1 + 1
if L1_1 == 9 then
  L2_1 = add_parents
  L2_1()
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
else
  L0_1[1] = L1_1
  L2_1 = MpCommon
  L2_1 = L2_1.OverwritePersistContextNoPath
  L3_1 = "EmailCollection"
  L4_1 = L0_1
  L5_1 = 60
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
