-- Threat: !InfrastructureShared
-- Name: a1b30ca210b3
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5]
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0.utf8p2)
  if l_0_1 ~= nil then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      if sysio.IsFileExists(l_0_3) then
        bm.add_related_file(l_0_3)
      end
    end
  end
end
return mp.INFECTED
