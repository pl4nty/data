-- Threat: !InfrastructureShared
-- Name: 9ab3c43d057f
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[1].utf8p2)
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_2)
    if sysio.IsFileExists(l_0_2) then
      bm.add_related_file(l_0_2)
    end
  end
end
return mp.INFECTED
