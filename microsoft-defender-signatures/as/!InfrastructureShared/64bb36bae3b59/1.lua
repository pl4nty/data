local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L1_1 = "T1204"
L2_1 = "Execution_UserExecution_ExactMatch"
L3_1 = this_sigattrlog
L3_1 = L3_1[17]
L3_1 = L3_1.matched
if not L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[18]
  L3_1 = L3_1.matched
  if not L3_1 then
    goto lbl_15
  end
end
L1_1 = "T1543.001"
L2_1 = "Persistence_LaunchAgent_ExactMatch"
::lbl_15::
L3_1 = this_sigattrlog
L3_1 = L3_1[16]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[16]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[16]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[16]
      L0_1 = L3_1.utf8p1
    end
  end
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L0_1
  L5_1 = "/DAFOM%-%d+%.%d+%.%d+%.dmg$"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[26]
L3_1 = L3_1.matched
if not L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[19]
  L3_1 = L3_1.matched
  if not L3_1 then
    goto lbl_91
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[26]
L3_1 = L3_1.utf8p1
if L3_1 ~= nil then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[26]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= "" then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[26]
    L0_1 = L3_1.utf8p1
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[19]
L3_1 = L3_1.utf8p1
if L3_1 ~= nil then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[19]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= "" then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[19]
    L0_1 = L3_1.utf8p1
  end
end
if L0_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L0_1
  L5_1 = "/DAFOM%-%d+%.%d+%.%d+%.app/"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    goto lbl_91
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_91::
L3_1 = bm
L3_1 = L3_1.get_process_relationships
L3_1, L4_1 = L3_1()
if L4_1 ~= nil then
  L5_1 = ipairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = bm
    L10_1 = L10_1.trigger_sig
    L11_1 = "BmTraverseTreeBlockMac"
    L12_1 = "Detected"
    L13_1 = L9_1.ppid
    L10_1(L11_1, L12_1, L13_1)
  end
end
L5_1 = this_sigattrlog
L5_1 = L5_1[20]
L5_1 = L5_1.matched
if not L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[21]
  L5_1 = L5_1.matched
  if not L5_1 then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[22]
    L5_1 = L5_1.matched
    if not L5_1 then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[23]
      L5_1 = L5_1.matched
      if not L5_1 then
        L5_1 = this_sigattrlog
        L5_1 = L5_1[24]
        L5_1 = L5_1.matched
        if not L5_1 then
          L5_1 = this_sigattrlog
          L5_1 = L5_1[25]
          L5_1 = L5_1.matched
          if not L5_1 then
            L5_1 = this_sigattrlog
            L5_1 = L5_1[26]
            L5_1 = L5_1.matched
            if not L5_1 then
              goto lbl_214
            end
          end
        end
      end
    end
  end
end
L5_1 = bm
L5_1 = L5_1.get_imagepath
L5_1 = L5_1()
L6_1 = IsExcludedByImagePathMacOS
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm
L6_1 = L6_1.get_current_process_startup_info
L6_1 = L6_1()
if L6_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = L6_1.command_line
L8_1 = IsExcludedByCmdlineMacOS
L9_1 = L7_1
L8_1 = L8_1(L9_1)
if L8_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = SuspMacPathsToMonitor
L9_1 = L5_1
L10_1 = true
L8_1 = L8_1(L9_1, L10_1)
if not L8_1 then
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L5_1
  L10_1 = "/Users/[^/]+/Downloads/"
  L11_1 = 1
  L12_1 = false
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if not L8_1 then
    L8_1 = string
    L8_1 = L8_1.find
    L9_1 = L5_1
    L10_1 = "/Users/[^/]+/Documents/"
    L11_1 = 1
    L12_1 = false
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if not L8_1 then
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L5_1
      L10_1 = "/Users/[^/]+/Desktop/"
      L11_1 = 1
      L12_1 = false
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if not L8_1 then
        goto lbl_214
      end
    end
  end
end
L8_1 = sysio
L8_1 = L8_1.IsFileExists
L9_1 = L5_1
L8_1 = L8_1(L9_1)
if L8_1 then
  L8_1 = bm
  L8_1 = L8_1.add_threat_file
  L9_1 = L5_1
  L8_1(L9_1)
end
::lbl_214::
L5_1 = TrackPidAndTechniqueBM
L6_1 = "BM"
L7_1 = L1_1
L8_1 = L2_1
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
