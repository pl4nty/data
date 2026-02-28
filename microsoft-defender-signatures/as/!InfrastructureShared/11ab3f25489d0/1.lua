local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L3_1 = false
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.utf8p1
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L0_1 = L4_1.utf8p1
  end
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    L4_1 = L4_1.utf8p1
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[5]
      L4_1 = L4_1.utf8p1
      if L4_1 ~= "" then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[5]
        L0_1 = L4_1.utf8p1
      end
    end
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p1
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L4_1 = L4_1.utf8p2
      if L4_1 ~= nil then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[2]
        L4_1 = L4_1.utf8p2
        if L4_1 ~= "" then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[2]
          L1_1 = L4_1.utf8p1
          L4_1 = this_sigattrlog
          L4_1 = L4_1[2]
          L2_1 = L4_1.utf8p2
        end
      end
    end
  end
end
L4_1 = {}
L5_1 = "/tmp/test10"
L6_1 = "/private/tmp/test10"
L7_1 = "/tmp/test9.scpt"
L8_1 = "/private/tmp/test9.scpt"
L9_1 = "/usr/local/bin/com.docker.sock"
L10_1 = "/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool"
L11_1 = "/usr/local/bin/com.docker.vmnat"
L12_1 = "/usr/local/bin/com.docker.vmnat.lock"
L13_1 = "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon"
L14_1 = "/Library/PrivilegedHelperTools/us.zoom.ZoomService"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L5_1 = ipairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L1_1
  L12_1 = L9_1
  L13_1 = 1
  L14_1 = true
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 == 1 then
    L3_1 = true
    break
  end
end
if not L3_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = IsExcludedByCmdlineMacOS
L6_1 = L2_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = IsExcludedByImagePathMacOS
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    goto lbl_117
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_117::
if L0_1 ~= nil and L0_1 ~= "" and L1_1 ~= nil and L1_1 ~= "" then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = "/System/"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= 1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L0_1
    L7_1 = ".app/Contents/"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      goto lbl_146
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_146::
L5_1 = IsKeyValuePairInRollingQueue
L6_1 = "MAC_UNS_ADHOC_PATHS"
L7_1 = "unsigned_adhoc_items"
L8_1 = L1_1
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 then
  L5_1 = bm
  L5_1 = L5_1.trigger_sig
  L6_1 = "AdhocPersistDPRK"
  L7_1 = L0_1
  L5_1(L6_1, L7_1)
  L5_1 = sysio
  L5_1 = L5_1.IsFileExists
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = bm
    L5_1 = L5_1.add_threat_file
    L6_1 = L1_1
    L5_1(L6_1)
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
