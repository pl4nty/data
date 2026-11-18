-- Threat: !InfrastructureShared
-- Name: 83b32b82630f
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p2)
end
if l_0_0 ~= nil and l_0_0 ~= "" then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3 ~= nil and l_0_3 ~= "" and sysio.IsFileExists(l_0_3) and not mp.IsKnownFriendlyFile(l_0_3, false, false) then
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
