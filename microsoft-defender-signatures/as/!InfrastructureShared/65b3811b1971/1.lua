local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = "WinlogonHelper"
L1_1 = isnull
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.utf8p1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.utf8p1
  L2_1 = L2_1(L3_1)
  L3_1 = "^hkc?u"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = isnull
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.utf8p2
      L3_1 = "explorer%.exe$"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        goto lbl_40
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_40::
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = string
L2_1 = L2_1.match
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L3_1 = L3_1.utf8p2
L4_1 = ";To:(.+)"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p2
end
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.ContextualExpandEnvironmentVariables
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.add_threat_file
L3_1 = L1_1
L2_1(L3_1)
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = L0_1
L4_1 = safeJsonSerialize
L5_1 = {}
L5_1.Shell = L1_1
L6_1 = this_sigattrlog
L6_1 = L6_1[4]
L6_1 = L6_1.utf8p1
L5_1.P1 = L6_1
L6_1 = this_sigattrlog
L6_1 = L6_1[4]
L6_1 = L6_1.utf8p2
L5_1.P2 = L6_1
L4_1 = L4_1(L5_1)
L5_1 = bm
L5_1 = L5_1.RelatedStringBMReport
L2_1(L3_1, L4_1, L5_1)
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 then
  L3_1 = L2_1.ppid
  if L3_1 then
    L3_1 = TrackPidAndTechniqueBM
    L4_1 = L2_1.ppid
    L5_1 = "T1547.004"
    L6_1 = "persist_winlogon_shell"
    L3_1(L4_1, L5_1, L6_1)
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
