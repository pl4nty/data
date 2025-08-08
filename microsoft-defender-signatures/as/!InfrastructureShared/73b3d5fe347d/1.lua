-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b3d5fe347d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
local l_0_2 = false
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC22: Overwrote pending register: R2 in 'AssignReg'

local l_0_3 = nil
for l_0_7,l_0_8 in ipairs({"/tmp/test10", "/private/tmp/test10", "/tmp/test9.scpt", "/private/tmp/test9.scpt", "/usr/local/bin/com.docker.sock", "/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool", "/usr/local/bin/com.docker.vmnat", "/usr/local/bin/com.docker.vmnat.lock", "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon", "/Library/PrivilegedHelperTools/us.zoom.ZoomService"}) do
  local l_0_4 = nil
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R8 in 'UnsetPending'

  if (string.find)(l_0_3, "/usr/local/bin/com.docker.sock", 1, true) == 1 then
    l_0_2 = true
    break
  end
end
do
  if not l_0_2 then
    return mp.CLEAN
  end
  l_0_1 = (bm.get_imagepath)()
  if IsExcludedByImagePathMacOS(l_0_1) then
    return mp.CLEAN
  end
  local l_0_9 = nil
  if (bm.get_current_process_startup_info)() == nil then
    return mp.CLEAN
  end
  local l_0_10 = nil
  if IsExcludedByCmdlineMacOS(((bm.get_current_process_startup_info)()).command_line) then
    return mp.CLEAN
  end
  if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_1) then
    (bm.trigger_sig)("BM_UnsProcCreatedUnsFile", l_0_3)
    if (sysio.IsFileExists)(l_0_3) then
      (bm.add_threat_file)(l_0_3)
    end
    if (SuspMacPathsToMonitor(l_0_1, true) or (string.find)(l_0_1, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_1, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_1, "/Users/[^/]+/Desktop/", 1, false)) and (sysio.IsFileExists)(l_0_1) then
      (bm.add_threat_file)(l_0_1)
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

