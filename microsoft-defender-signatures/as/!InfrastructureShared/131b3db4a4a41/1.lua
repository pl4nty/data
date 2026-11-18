-- Threat: !InfrastructureShared
-- Name: 131b3db4a4a41
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  local l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_0 = string.match(l_0_1, "/([0-9a-f]+)/init.pid$")
end
if not (l_0_0 ~= nil and MpCommon.QueryPersistContextNoPath("docker_create", l_0_0)) or not MpCommon.QueryPersistContextNoPath("docker_start", l_0_0) then
  return mp.CLEAN
end
return mp.INFECTED
