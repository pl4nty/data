local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = MpCommon
L0_1 = L0_1.GetPersistContextCountNoPath
L1_1 = "CreatedAppDataMsi"
L0_1 = L0_1(L1_1)
if 0 < L0_1 then
  L0_1 = MpCommon
  L0_1 = L0_1.GetPersistContextNoPath
  L1_1 = "CreatedAppDataMsi"
  L0_1 = L0_1(L1_1)
  if L0_1 ~= nil then
    L1_1 = ipairs
    L2_1 = L0_1
    L1_1, L2_1, L3_1 = L1_1(L2_1)
    for L4_1, L5_1 in L1_1, L2_1, L3_1 do
      L6_1 = sysio
      L6_1 = L6_1.IsFileExists
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      if L6_1 then
        L6_1 = bm
        L6_1 = L6_1.add_related_file
        L7_1 = L5_1
        L6_1(L7_1)
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
