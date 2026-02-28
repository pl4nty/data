local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = MpCommon
L1_1 = L1_1.GetMountedFileBackingFilePath
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.enum_mpattributesubstring
  L3_1 = "ESRP:PEStatic:"
  L2_1 = L2_1(L3_1)
  L3_1 = #L2_1
  if 0 < L3_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.enum_mpattributesubstring
  L4_1 = "BM_ESRP:"
  L3_1 = L3_1(L4_1)
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    if L8_1 == "BM_ESRP:Lua:VulnerableAsrNotOnClose" then
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    end
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L8_1
    L11_1 = "^BM_ESRP:Hstr:"
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 then
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
