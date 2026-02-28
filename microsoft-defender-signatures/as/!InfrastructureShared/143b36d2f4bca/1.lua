local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  if L0_1 then
    goto lbl_12
  end
end
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
::lbl_12::
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.utf8p1
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = isnull
    L2_1 = L0_1.utf8p2
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      goto lbl_30
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_30::
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1.utf8p2
L3_1 = "injectiontype:(.-);(.*)"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = string
L3_1 = L3_1.match
L4_1 = L0_1.utf8p1
L5_1 = "imagename:.+;targetprocessppid:(%d+):(%d+)$"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L5_1 = isnull
L6_1 = L3_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = isnull
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    goto lbl_53
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_53::
L5_1 = string
L5_1 = L5_1.format
L6_1 = "pid:%d,ProcessStart:%d"
L7_1 = L3_1
L8_1 = L4_1
L5_1 = L5_1(L6_1, L7_1, L8_1)
L6_1 = string
L6_1 = L6_1.match
L7_1 = L0_1.utf8p2
L8_1 = "apcoriginalprocessppid:(%d+):(%d+);"
L6_1, L7_1 = L6_1(L7_1, L8_1)
L8_1 = nil
L9_1 = isnull
L10_1 = L6_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = isnull
  L10_1 = L7_1
  L9_1 = L9_1(L10_1)
  if not L9_1 then
    L9_1 = string
    L9_1 = L9_1.format
    L10_1 = "pid:%d,ProcessStart:%d"
    L11_1 = L6_1
    L12_1 = L7_1
    L9_1 = L9_1(L10_1, L11_1, L12_1)
    L8_1 = L9_1
  end
end
L9_1 = "processinjection_wmplayer"
L10_1 = safeJsonSerialize
L11_1 = {}
L12_1 = L0_1.utf8p1
L11_1.Target = L12_1
L11_1.Type = L1_1
L12_1 = L2_1 or L12_1
if not L2_1 then
  L12_1 = "N/A"
end
L11_1.Info = L12_1
L10_1 = L10_1(L11_1)
L11_1 = bm
L11_1 = L11_1.add_related_string
L12_1 = L9_1
L13_1 = L10_1
L14_1 = bm
L14_1 = L14_1.RelatedStringBMReport
L11_1(L12_1, L13_1, L14_1)
L11_1 = bm
L11_1 = L11_1.get_current_process_startup_info
L11_1 = L11_1()
if L11_1 then
  L12_1 = L11_1.ppid
  if L12_1 then
    L12_1 = TrackPidAndTechniqueBM
    L13_1 = L11_1.ppid
    L14_1 = "T1055.001"
    L15_1 = L9_1
    L12_1(L13_1, L14_1, L15_1)
  end
end
L12_1 = bm
L12_1 = L12_1.add_related_process
L13_1 = L5_1
L12_1(L13_1)
L12_1 = TrackPidAndTechniqueBM
L13_1 = L5_1
L14_1 = "T1055.001"
L15_1 = string
L15_1 = L15_1.format
L16_1 = "%s_target"
L17_1 = L9_1
L15_1, L16_1, L17_1 = L15_1(L16_1, L17_1)
L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
if L8_1 then
  L12_1 = bm
  L12_1 = L12_1.add_related_process
  L13_1 = L8_1
  L12_1(L13_1)
  L12_1 = TrackPidAndTechniqueBM
  L13_1 = L8_1
  L14_1 = "T1055.001"
  L15_1 = string
  L15_1 = L15_1.format
  L16_1 = "%s_source"
  L17_1 = L9_1
  L15_1, L16_1, L17_1 = L15_1(L16_1, L17_1)
  L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
end
L12_1 = mp
L12_1 = L12_1.INFECTED
return L12_1
