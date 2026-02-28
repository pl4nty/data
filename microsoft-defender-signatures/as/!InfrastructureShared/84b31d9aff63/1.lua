local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
if L1_1 ~= nil then
  L2_1 = ipairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = bm
    L7_1 = L7_1.trigger_sig
    L8_1 = "BmTraverseTreeBlockMac"
    L9_1 = "Detected"
    L10_1 = L6_1.ppid
    L7_1(L8_1, L9_1, L10_1)
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = bm
  L2_1 = L2_1.get_imagepath
  L2_1 = L2_1()
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = SuspMacPathsToMonitor
  L4_1 = L2_1
  L5_1 = true
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "/Users/[^/]+/Downloads/"
    L6_1 = 1
    L7_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "/Users/[^/]+/Documents/"
      L6_1 = 1
      L7_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = "/Users/[^/]+/Desktop/"
        L6_1 = 1
        L7_1 = false
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          goto lbl_77
        end
      end
    end
  end
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = bm
    L3_1 = L3_1.add_threat_file
    L4_1 = L2_1
    L3_1(L4_1)
  end
end
::lbl_77::
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1204"
L5_1 = "Execution_UserExecution_ExactMatch"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
