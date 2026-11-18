-- Threat: !InfrastructureShared
-- Name: 57b3da2d9e62
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if string.find(l_0_0, "/u ", 1, true) and string.find(l_0_0, "/i:", 1, true) then
    local l_0_1
    if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
      l_0_1 = this_sigattrlog[1].utf8p2
    end
    local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
    for l_0_3, l_0_4 in ipairs(l_0_2) do
      l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
      bm.add_threat_file(l_0_4)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
