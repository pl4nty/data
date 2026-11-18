-- Threat: !InfrastructureShared
-- Name: 7db3329961cb
-- Type: 21

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
  if l_0_0 ~= nil and string.len(l_0_0) > 3 then
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
