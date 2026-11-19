-- Threat: !InfrastructureShared
-- Name: 141b3dfc5f65b
-- Type: 21

if this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
  if string.find(l_0_0, "\\werfault.exe\\\\debugger", 1, true) or string.find(l_0_0, "\\osppsvc.exe\\\\debugger", 1, true) or string.find(l_0_0, "\\sppextcomobj.exe\\\\debugger", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = this_sigattrlog[3].utf8p2
  if l_0_1 ~= nil and 3 < string.len(l_0_1) then
    l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
    if not sysio.IsFileExists(l_0_1) then
      return mp.CLEAN
    end
    if mp.IsKnownFriendlyFile(l_0_1, true, false) == true then
      return mp.CLEAN
    end
    local l_0_2 = sysio.GetFileLastWriteTime(l_0_1)
    if sysio.GetLastResult().Success and l_0_2 ~= 0 then
      l_0_2 = l_0_2 / 10000000 - 11644473600
      local l_0_3 = MpCommon.GetCurrentTimeT()
      if l_0_2 > l_0_3 or 3600 < l_0_3 - l_0_2 then
        return mp.CLEAN
      end
    end
    l_0_1 = string.lower(l_0_1)
    if string.find(l_0_1, "awdump.exe", 1, true) or string.find(l_0_1, "awdumpifeo.exe", 1, true) or string.find(l_0_1, "appdeploytoolkit_blockappexecutionmessage.vbs", 1, true) or string.find(l_0_1, "patchmypc-preventstart.exe", 1, true) then
      return mp.CLEAN
    end
    bm.add_threat_file(l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN
