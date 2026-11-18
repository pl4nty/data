-- Threat: !InfrastructureShared
-- Name: d2b319654db8
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  if string.find(l_0_0, "\\werfault.exe\\debugger", 1, true) or string.find(l_0_0, "\\osppsvc.exe\\debugger", 1, true) or string.find(l_0_0, "\\sppextcomobj.exe\\debugger", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = this_sigattrlog[1].utf8p2
  if l_0_1 ~= nil and string.len(l_0_1) > 3 then
    l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
    if sysio.IsFileExists(l_0_1) and mp.IsKnownFriendlyFile(l_0_1, true, false) == false then
      mp.ReportLowfi(l_0_1, 794607441)
      bm.add_related_file(l_0_1)
    else
      local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
      for l_0_3, l_0_4 in ipairs(l_0_2) do
        if l_0_4 ~= nil and string.len(l_0_4) > 3 and sysio.IsFileExists(l_0_4) and mp.IsKnownFriendlyFile(l_0_4, true, false) == false then
          mp.ReportLowfi(l_0_4, 794607441)
          bm.add_related_file(l_0_4)
        end
      end
    end
  end
end
return mp.INFECTED
