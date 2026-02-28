local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L0_1 = L1_1.utf8p2
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[3]
        L0_1 = L1_1.utf8p2
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.rtf|"
  L2_1 = bm_AddRelatedFileFromCommandLine
  L3_1 = L0_1
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.ReportLowfi
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p1
      L4_1 = 2288844567
      L2_1(L3_1, L4_1)
    end
  end
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.utf8p2
      L3_1 = "|.lnk|"
      L4_1 = bm_AddRelatedFileFromCommandLine
      L5_1 = L2_1
      L6_1 = L3_1
      L4_1(L5_1, L6_1)
    end
  end
  L2_1 = bm
  L2_1 = L2_1.trigger_sig_self_propagate
  L3_1 = "SuspChildProcessLaunch"
  L4_1 = "Behavior:Win32/StarStickle.A!dha"
  L2_1(L3_1, L4_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
