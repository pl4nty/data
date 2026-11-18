-- Threat: !InfrastructureShared
-- Name: 66b3d25764c0
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
  if l_0_0 ~= nil and string.len(l_0_0) > 3 then
    local l_0_1 = false
    local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
    if l_0_2 ~= nil then
      for l_0_3, l_0_4 in ipairs(l_0_2) do
        l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
        bm.add_related_file(l_0_4)
        l_0_1 = true
      end
    end
    if l_0_1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
