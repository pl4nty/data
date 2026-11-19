-- Threat: !InfrastructureShared
-- Name: 7cb34bebf9f3
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2
l_0_1, l_0_2 = string.match(l_0_0, "postgres (%d+%.%d+%.%d+%.%d+)%((%d+)%) ")
if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = "postgres_connections_" .. l_0_1
if MpCommon.GetPersistContextCountNoPath(l_0_3) > 30 then
  MpCommon.OverwritePersistContextNoPath(l_0_3, {"cooldown"}, 3600)
  return mp.INFECTED
end
return mp.CLEAN
