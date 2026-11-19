-- Threat: !InfrastructureShared
-- Name: 35b3a2701902
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = this_sigattrlog[1]
else
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0.utf8p2)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_3))
    if (sysio.IsFileExists(l_0_3 .. "\\mozcrt19.dll") or sysio.IsFileExists(l_0_3 .. "\\mozsqlite3.dll") or sysio.IsFileExists(l_0_3 .. "\\sqlite3.dll")) and not string.find(l_0_3, "\\mozilla firefox", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
