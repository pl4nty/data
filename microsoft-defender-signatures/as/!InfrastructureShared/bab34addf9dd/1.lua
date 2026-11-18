-- Threat: !InfrastructureShared
-- Name: bab34addf9dd
-- Type: 21

local l_0_0
local l_0_1 = "docker_start"
if this_sigattrlog[2].matched then
  local l_0_2 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_0 = string.match(l_0_2, "/([0-9a-f]+)/hosts$")
end
if l_0_0 ~= nil then
  MpCommon.AppendPersistContextNoPath(l_0_1, l_0_0, 3600)
end
return mp.CLEAN
