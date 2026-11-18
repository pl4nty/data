-- Threat: !InfrastructureShared
-- Name: 1c9b34cd1368d
-- Type: 21

local l_0_0
if this_sigattrlog[9].matched then
  l_0_0 = string.lower(this_sigattrlog[9].utf8p2)
elseif this_sigattrlog[10].matched then
  l_0_0 = string.lower(this_sigattrlog[10].utf8p2)
elseif this_sigattrlog[11].matched then
  l_0_0 = string.lower(this_sigattrlog[11].utf8p2)
else
  return mp.CLEAN
end
if l_0_0 ~= nil then
  if string.find(l_0_0, "\\windows\\temp\\nessus", 1, true) or string.find(l_0_0, "\\windows\\temp\\fstmp\\", 1, true) or string.find(l_0_0, "\\windows\\ccm", 1, true) or string.find(l_0_0, "netstat", 1, true) or string.find(l_0_0, "netsh", 1, true) or string.find(l_0_0, "\\temp\\honeywell\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 ~= nil then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      if mp.IsKnownFriendlyFile(l_0_3, true, false) == false and sysio.IsFileExists(l_0_3) then
        mp.ReportLowfi(l_0_3, 2850103465)
      end
    end
  end
end
return mp.INFECTED
