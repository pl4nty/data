local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = "ExecutableNonTextSection"
L1_1 = isnull
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.utf8p1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = string
L1_1 = L1_1.match
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.utf8p1
L3_1 = "OriginalPath:(.-)_OriginalSection:(.+)"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_39
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_39::
L3_1 = bm
L3_1 = L3_1.add_threat_file
L4_1 = L1_1
L3_1(L4_1)
L3_1 = bm
L3_1 = L3_1.add_threat_file
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.utf8p1
L3_1(L4_1)
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = L0_1
L5_1 = safeJsonSerialize
L6_1 = {}
L6_1.Original = L1_1
L7_1 = this_sigattrlog
L7_1 = L7_1[2]
L7_1 = L7_1.utf8p1
L6_1.Embedded = L7_1
L6_1.Section = L2_1
L5_1 = L5_1(L6_1)
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
if L3_1 then
  L4_1 = L3_1.ppid
  if L4_1 then
    L4_1 = TrackPidAndTechniqueBM
    L5_1 = L3_1.ppid
    L6_1 = "T1027.009"
    L7_1 = "evasion_embeddedpe"
    L4_1(L5_1, L6_1, L7_1)
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
