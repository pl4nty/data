local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpIsPowerShellAMSIScan"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetBruteMatchData
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.match_offset
L1_1 = L1_1 + 1
L2_1 = L0_1.match_offset
L2_1 = L2_1 + 1
L2_1 = L2_1 + 512
L3_1 = tostring
L4_1 = L0_1.is_header
if L4_1 then
  L4_1 = headerpage
  if L4_1 then
    goto lbl_31
  end
end
L4_1 = footerpage
::lbl_31::
L3_1 = L3_1(L4_1)
L4_1 = L3_1
L3_1 = L3_1.sub
L5_1 = L1_1
L6_1 = L2_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = L3_1
L3_1 = L3_1.lower
L3_1 = L3_1(L4_1)
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "disable%-windowsoptionalfeature"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L5_1 = L3_1
  L4_1 = L3_1.match
  L6_1 = "windows%-defender"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    goto lbl_51
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_51::
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "windows%-defender%-applicationguard"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = isTamperProtectionOn
L4_1 = L4_1()
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.NidSearch
L5_1 = mp
L5_1 = L5_1.NID_ENABLE_EXTENDED_BAFS
L6_1 = 3
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = set_research_data
  L5_1 = "AggressivePeTrigger"
  L6_1 = "true"
  L7_1 = false
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = MpCommon
L4_1 = L4_1.NidSearch
L5_1 = mp
L5_1 = L5_1.NID_ENABLE_EXTENDED_BAFS
L6_1 = 6
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = set_research_data
  L5_1 = "E5EmergencyAntiTampering"
  L6_1 = "true"
  L7_1 = false
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = mp
L4_1 = L4_1.LOWFI
return L4_1
