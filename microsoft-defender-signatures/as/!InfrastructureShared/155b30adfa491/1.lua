-- Threat: !InfrastructureShared
-- Name: 155b30adfa491
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil and this_sigattrlog[4].utf8p2 ~= "" then
  local l_0_0 = bm.get_current_process_startup_info()
  local l_0_1 = l_0_0.command_line
  local l_0_2 = bm.get_imagepath()
  if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
    return mp.CLEAN
  end
  if l_0_1:find("DropboxUpdater --server", 1, true) or l_0_1:find("/Applications/hoteling-client.app", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = this_sigattrlog[4].utf8p2
  if SuspMacPathsToMonitor(l_0_3, true) and l_0_3:match("/%.[^/]+$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
