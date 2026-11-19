-- Threat: !InfrastructureShared
-- Name: e5b31afc50da
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil and l_0_0 ~= "" then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 ~= nil then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
