local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L1_1 = false
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= "" then
      goto lbl_21
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_21::
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L2_1 = L3_1.utf8p2
L3_1 = {}
L4_1 = "/tmp/test10"
L5_1 = "/private/tmp/test10"
L6_1 = "/tmp/test9.scpt"
L7_1 = "/private/tmp/test9.scpt"
L8_1 = "/usr/local/bin/com.docker.sock"
L9_1 = "/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool"
L10_1 = "/usr/local/bin/com.docker.vmnat"
L11_1 = "/usr/local/bin/com.docker.vmnat.lock"
L12_1 = "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon"
L13_1 = "/Library/PrivilegedHelperTools/us.zoom.ZoomService"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L2_1
  L11_1 = L8_1
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 == 1 then
    L1_1 = true
    break
  end
end
if not L1_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = bm
L4_1 = L4_1.get_imagepath
L4_1 = L4_1()
L0_1 = L4_1
L4_1 = IsExcludedByImagePathMacOS
L5_1 = L0_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = bm
L4_1 = L4_1.get_current_process_startup_info
L4_1 = L4_1()
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L4_1.command_line
L6_1 = IsExcludedByCmdlineMacOS
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = IsKeyValuePairInRollingQueue
L7_1 = "MAC_UNS_ADHOC_PATHS"
L8_1 = "unsigned_adhoc_items"
L9_1 = L0_1
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 then
  L6_1 = bm
  L6_1 = L6_1.trigger_sig
  L7_1 = "BM_UnsProcCreatedUnsFile"
  L8_1 = L2_1
  L6_1(L7_1, L8_1)
  L6_1 = sysio
  L6_1 = L6_1.IsFileExists
  L7_1 = L2_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = bm
    L6_1 = L6_1.add_threat_file
    L7_1 = L2_1
    L6_1(L7_1)
  end
  L6_1 = SuspMacPathsToMonitor
  L7_1 = L0_1
  L8_1 = true
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L0_1
    L8_1 = "/Users/[^/]+/Downloads/"
    L9_1 = 1
    L10_1 = false
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L0_1
      L8_1 = "/Users/[^/]+/Documents/"
      L9_1 = 1
      L10_1 = false
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L0_1
        L8_1 = "/Users/[^/]+/Desktop/"
        L9_1 = 1
        L10_1 = false
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          goto lbl_152
        end
      end
    end
  end
  L6_1 = sysio
  L6_1 = L6_1.IsFileExists
  L7_1 = L0_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = bm
    L6_1 = L6_1.add_threat_file
    L7_1 = L0_1
    L6_1(L7_1)
  end
  ::lbl_152::
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
