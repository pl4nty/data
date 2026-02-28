local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = isnull
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = isnull
  L1_1 = this_sigattrlog
  L1_1 = L1_1[8]
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_16
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::
L0_1 = mp
L0_1 = L0_1.ContextualExpandEnvironmentVariables
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = this_sigattrlog
L2_1 = L2_1[6]
L2_1 = L2_1.utf8p1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = ""
end
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.ContextualExpandEnvironmentVariables
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = this_sigattrlog
L3_1 = L3_1[8]
L3_1 = L3_1.utf8p1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = ""
end
L1_1 = L1_1(L2_1)
L2_1 = isnull
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_53
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_53::
L2_1 = bm
L2_1 = L2_1.add_related_file
L3_1 = L0_1
L2_1(L3_1)
L2_1 = bm
L2_1 = L2_1.add_related_file
L3_1 = L1_1
L2_1(L3_1)
L2_1 = string
L2_1 = L2_1.match
L3_1 = this_sigattrlog
L3_1 = L3_1[6]
L3_1 = L3_1.utf8p2
L4_1 = ";FSize:(.*)"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = -1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = this_sigattrlog
L4_1 = L4_1[8]
L4_1 = L4_1.utf8p2
L5_1 = ";FSize:(.*)"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = -1
end
L4_1 = bm
L4_1 = L4_1.set_detection_string
L5_1 = safeJsonSerialize
L6_1 = {}
L6_1.SAMPath = L0_1
L6_1.SECURITYPath = L1_1
L6_1.SAMSize = L2_1
L6_1.SECURITYSize = L3_1
L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
L4_1(L5_1, L6_1, L7_1, L8_1)
L4_1 = bm
L4_1 = L4_1.add_related_string
L5_1 = "DumpInfo"
L6_1 = safeJsonSerialize
L7_1 = {}
L7_1.SAMPath = L0_1
L7_1.SECPath = L1_1
L7_1.SAMSize = L2_1
L7_1.SECSize = L3_1
L8_1 = this_sigattrlog
L8_1 = L8_1[6]
L8_1 = L8_1.utf8p2
L7_1.SAMInfo = L8_1
L8_1 = this_sigattrlog
L8_1 = L8_1[8]
L8_1 = L8_1.utf8p2
L7_1.SECInfo = L8_1
L6_1 = L6_1(L7_1)
L7_1 = bm
L7_1 = L7_1.RelatedStringBMReport
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
