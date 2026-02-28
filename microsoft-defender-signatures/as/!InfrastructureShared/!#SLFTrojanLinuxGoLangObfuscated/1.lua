local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:GoLang:pclntab_magic_unknown"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = mp
  L1_1 = L1_1.bitand
  L2_1 = L0_1
  L3_1 = 4294967280
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= 4294967280 then
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.FILEPATH_QUERY_FULL
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
    L2_1 = 86400
    L3_1 = "obfuscated_golang"
    L4_1 = pcall
    L5_1 = MpCommon
    L5_1 = L5_1.RollingQueueCreate
    L6_1 = L3_1
    L7_1 = 500
    L8_1 = L2_1
    L9_1 = 1
    L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
    if not L4_1 then
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
    L6_1 = pcall
    L7_1 = MpCommon
    L7_1 = L7_1.RollingQueueAppend
    L8_1 = L3_1
    L9_1 = L1_1
    L10_1 = ""
    L11_1 = L2_1
    L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
    L5_1 = L7_1
    L4_1 = L6_1
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
