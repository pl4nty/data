-- Threat: !InfrastructureShared
-- Name: 21b36fa5d3eb
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2))
end
if l_0_0 ~= nil then
  if string.find(l_0_0, "\\program files.+dropbox\\client\\dropboxext") or string.find(l_0_0, "\\appdata\\local\\microsoft\\teamsmeetingaddin\\.+\\microsoft.teams.addinloader.dll") then
    return mp.CLEAN
  end
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3 ~= nil and l_0_3:len() > 3 and sysio.IsFileExists(l_0_3) then
      if mp.IsKnownFriendlyFile(l_0_3, true, false) == true then
        return mp.CLEAN
      end
      mp.ReportLowfi(l_0_3, 1891100223)
      bm.add_related_file(l_0_3)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
