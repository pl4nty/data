-- Threat: !InfrastructureShared
-- Name: d2b358d007e9
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if string.find(l_0_0, "\\werfault.exe\\\\debugger", 1, true) or string.find(l_0_0, "\\osppsvc.exe\\\\debugger", 1, true) or string.find(l_0_0, "\\sppextcomobj.exe\\\\debugger", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = this_sigattrlog[1].utf8p2
  if l_0_1 ~= nil and string.len(l_0_1) > 3 then
    l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
    if not sysio.IsFileExists(l_0_1) then
      l_0_1 = string.lower(bm.get_imagepath())
    end
    if mp.IsKnownFriendlyFile(l_0_1, true, false) == true then
      return mp.CLEAN
    end
    local l_0_2 = sysio.GetFileLastWriteTime(l_0_1)
    if sysio.GetLastResult().Success and l_0_2 ~= 0 then
      l_0_2 = l_0_2 / 10000000 - 11644473600
      local l_0_3 = MpCommon.GetCurrentTimeT()
      if l_0_2 > l_0_3 or 600 < l_0_3 - l_0_2 then
        return mp.CLEAN
      end
    end
    l_0_1 = string.lower(l_0_1)
    if string.find(l_0_1, "awdump.exe", 1, true) or string.find(l_0_1, "awdumpifeo.exe", 1, true) or string.find(l_0_1, "AppDeployToolkit_BlockAppExecutionMessage.vbs", 1, true) then
      return mp.CLEAN
    end
    mp.ReportLowfi(l_0_1, 794607441)
    bm.add_related_file(l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN
