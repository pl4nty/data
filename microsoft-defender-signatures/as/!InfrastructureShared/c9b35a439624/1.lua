local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p2
  end
end
if L0_1 ~= nil then
  L1_1 = bm_AddRelatedFileFromCommandLine
  L2_1 = L0_1
  L3_1 = nil
  L4_1 = nil
  L5_1 = 1
  L1_1(L2_1, L3_1, L4_1, L5_1)
end
L1_1 = MpCommon
L1_1 = L1_1.GetPersistContextNoPath
L2_1 = "ServiceCreationScript"
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = ipairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = sysio
    L7_1 = L7_1.IsFileExists
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = bm
      L7_1 = L7_1.add_related_file
      L8_1 = L6_1
      L7_1(L8_1)
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
