-- Threat: !InfrastructureShared
-- Name: 5bb3d08fe1e6
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
  if l_0_0 ~= nil and 3 < string.len(l_0_0) then
    local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
    if l_0_1 ~= nil then
      for l_0_2, l_0_3 in ipairs(l_0_1) do
        l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
        bm.add_related_file(l_0_3)
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
