local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.CLEAN
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    L1_1 = reportGenericRansomware
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    L3_1 = true
    L1_1 = L1_1(L2_1, L3_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p2
    if L1_1 then
      L1_1 = reportGenericRansomware
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      L3_1 = true
      L1_1 = L1_1(L2_1, L3_1)
      L0_1 = L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
if L0_1 == L1_1 then
  L1_1 = bm
  L1_1 = L1_1.get_current_process_startup_info
  L1_1 = L1_1()
  L2_1 = L1_1.command_line
  if L2_1 then
    L2_1 = bm_AddRelatedFileFromCommandLine
    L3_1 = L1_1.command_line
    L4_1 = nil
    L5_1 = nil
    L6_1 = 4
    L2_1(L3_1, L4_1, L5_1, L6_1)
  end
  L2_1 = pcall
  L3_1 = reportBmInfo
  L2_1, L3_1 = L2_1(L3_1)
  if not L2_1 and L3_1 then
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = "bmInfoFailReason"
    L6_1 = tostring
    L7_1 = L3_1
    L6_1 = L6_1(L7_1)
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
  end
  L4_1 = reportTimingData
  L4_1()
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
