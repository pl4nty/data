-- Threat: !InfrastructureShared
-- Name: fab3e0133a59
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
      l_0_1 = string.lower(bm.get_imagepath())
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
