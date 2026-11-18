-- Threat: !InfrastructureShared
-- Name: 145b3ec8d2f4f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  if sysio.IsFileExists(l_0_1) then
    bm.add_related_file(l_0_1)
  end
end
return mp.INFECTED
