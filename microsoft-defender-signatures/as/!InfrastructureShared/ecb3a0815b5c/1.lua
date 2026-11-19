-- Threat: !InfrastructureShared
-- Name: ecb3a0815b5c
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  if l_0_1 and next(l_0_1) then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
      if l_0_3 and sysio.IsFileExists(l_0_3) then
        bm.add_related_file(l_0_3)
      end
    end
  end
end
return mp.INFECTED
