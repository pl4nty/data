-- Threat: !InfrastructureShared
-- Name: 55b3e98d4b4b
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
