local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "PACKED_WITH:[CMDEmbedded]"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.HEADERPAGE_SZ
if L1_1 < 256 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = table
L2_1 = L2_1.insert
L3_1 = L1_1
L4_1 = L0_1
L2_1(L3_1, L4_1)
L2_1 = MpCommon
L2_1 = L2_1.SetPersistContextNoPath
L3_1 = "lnkarg_sb"
L4_1 = L1_1
L5_1 = 10
L2_1(L3_1, L4_1, L5_1)
L2_1 = {}
L3_1 = "odbcconf"
L4_1 = "rundll32"
L5_1 = "regsvr32"
L6_1 = "powershell"
L7_1 = "calc"
L8_1 = "wscript"
L9_1 = "cscript"
L10_1 = "mshta"
L11_1 = ".cmd"
L12_1 = ".bat"
L13_1 = "..\\.."
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
