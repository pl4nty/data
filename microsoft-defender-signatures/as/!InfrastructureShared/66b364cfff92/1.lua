local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = isnull
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.utf8p1
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = isnull
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_18
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_18::
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.utf8p1
L1_1 = string
L1_1 = L1_1.lower
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.utf8p2
L1_1 = L1_1(L2_1)
L2_1 = "[\\\"]mavinject.exe\" %d+ /injectrunning \"?c:\\-windows\\-system32\\-subsystems\\-appventsubsystems[36][24].dll\"? 1$"
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L0_1
L5_1 = "imagename:.+;targetprocessppid:(%d+):(%d+)$"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L5_1 = string
L5_1 = L5_1.match
L6_1 = L1_1
L7_1 = "(%d+) .-injectrunning (.+)$"
L5_1, L6_1 = L5_1(L6_1, L7_1)
L7_1 = isnull
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = isnull
  L8_1 = L3_1
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    L7_1 = isnull
    L8_1 = L5_1
    L7_1 = L7_1(L8_1)
    if not L7_1 and L3_1 == L5_1 then
      goto lbl_68
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_68::
L7_1 = bm
L7_1 = L7_1.get_current_process_startup_info
L7_1 = L7_1()
L7_1 = L7_1.ppid
L8_1 = isnull
L9_1 = L7_1
L8_1 = L8_1(L9_1)
if not L8_1 then
  L8_1 = TrackPidAndTechniqueBM
  L9_1 = L7_1
  L10_1 = "T1055.001"
  L11_1 = "processinjection"
  L8_1(L9_1, L10_1, L11_1)
end
L8_1 = string
L8_1 = L8_1.format
L9_1 = "pid:%d,ProcessStart:%d"
L10_1 = L3_1
L11_1 = L4_1
L8_1 = L8_1(L9_1, L10_1, L11_1)
L9_1 = TrackPidAndTechniqueBM
L10_1 = L8_1
L11_1 = "T1055.001"
L12_1 = "processinjection_target"
L9_1(L10_1, L11_1, L12_1)
L9_1 = bm
L9_1 = L9_1.add_related_process
L10_1 = L8_1
L9_1(L10_1)
L9_1 = pcall
L10_1 = mp
L10_1 = L10_1.GetExecutablesFromCommandLine
L11_1 = L6_1
L9_1, L10_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L11_1 = isnull
  L12_1 = L10_1[1]
  L11_1 = L11_1(L12_1)
  if not L11_1 then
    L11_1 = bm
    L11_1 = L11_1.add_related_file
    L12_1 = L10_1[1]
    L11_1(L12_1)
end
else
  L11_1 = bm
  L11_1 = L11_1.add_related_string
  L12_1 = "T1055.001_InjectedDLL_ErrorScanning"
  L13_1 = L6_1
  L14_1 = bm
  L14_1 = L14_1.RelatedStringBMReport
  L11_1(L12_1, L13_1, L14_1)
end
L11_1 = mp
L11_1 = L11_1.INFECTED
return L11_1
