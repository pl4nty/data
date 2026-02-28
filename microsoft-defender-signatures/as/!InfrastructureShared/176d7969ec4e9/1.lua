local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = "(icacls.*(MsSense|mpssvc|mpsdrv|wdnisdrv|wdfilter|wdboot|defender).*grant[\\s\\w:\\(,]+(&|\\|\\)|\\s|$))"
L3_1 = MpCommon
L3_1 = L3_1.StringRegExpSearch
L4_1 = L2_1
L5_1 = L1_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
if L4_1 then
  L5_1 = set_research_data
  L6_1 = "Evidence"
  L7_1 = MpCommon
  L7_1 = L7_1.Base64Encode
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  L8_1 = false
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
