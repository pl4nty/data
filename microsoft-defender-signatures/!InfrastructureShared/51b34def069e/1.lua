-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51b34def069e\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
local l_0_2 = nil
local l_0_3 = nil
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_4 = false
for l_0_8,l_0_9 in ipairs({"/tmp/test10", "/private/tmp/test10", "/tmp/test9.scpt", "/private/tmp/test9.scpt", "/usr/local/bin/com.docker.sock", "/library/privilegedhelpertools/us.zoom.zoomhelpertool", "/usr/local/bin/com.docker.vmnat", "/usr/local/bin/com.docker.vmnat.lock", "/library/privilegedhelpertools/com.microsoft.teams.teamsdaemon", "/library/privilegedhelpertools/us.zoom.zoomservice"}) do
  local l_0_5, l_0_6 = nil
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R9 in 'UnsetPending'

  if (string.find)((this_sigattrlog[3]).utf8p2, "/usr/local/bin/com.docker.sock", 1, true) == 1 then
    l_0_4 = true
    break
  end
end
do
  if not l_0_4 then
    return mp.CLEAN
  end
  l_0_3 = (bm.get_imagepath)()
  if IsExcludedByImagePathMacOS(l_0_3) then
    return mp.CLEAN
  end
  local l_0_10 = nil
  if (bm.get_current_process_startup_info)() == nil then
    return mp.CLEAN
  end
  local l_0_11 = nil
  if IsExcludedByCmdlineMacOS(((bm.get_current_process_startup_info)()).command_line) then
    return mp.CLEAN
  end
  if not IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", (string.lower)(l_0_3)) then
    return mp.CLEAN
  end
  local l_0_12 = nil
  for l_0_16 = mp.SIGATTR_LOG_SZ - 1, 1, -1 do
    local l_0_13, l_0_14 = nil
    if sigattr_tail[.end] ~= nil and (sigattr_tail[.end]).attribute ~= nil and (sigattr_tail[.end]).attribute == 16384 and (sigattr_tail[.end]).utf8p1 ~= nil and (sigattr_tail[.end]).utf8p1 ~= "" and ((sigattr_tail[.end]).utf8p1):lower() == l_0_10 then
      l_0_2 = (sigattr_tail[.end]).utf8p1
      ;
      (bm.trigger_sig)("BM_UnsProcCreatedUnsFile", l_0_2)
      if (sysio.IsFileExists)(l_0_2) then
        (bm.add_threat_file)(l_0_2)
      end
      if (SuspMacPathsToMonitor(l_0_3, true) or (string.find)(l_0_3, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_3, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_3, "/Users/[^/]+/Desktop/", 1, false)) and (sysio.IsFileExists)(l_0_3) then
        (bm.add_threat_file)(l_0_3)
      end
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

