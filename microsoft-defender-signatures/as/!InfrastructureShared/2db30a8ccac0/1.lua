-- Threat: !InfrastructureShared
-- Name: 2db30a8ccac0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil and l_0_0 ~= "" then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3 ~= nil and l_0_3 ~= "" and sysio.IsFileExists(l_0_3) and not mp.IsKnownFriendlyFile(l_0_3, false, false) then
      bm.add_related_file(l_0_3)
    end
  end
end
reportSessionInformation()
return mp.INFECTED
