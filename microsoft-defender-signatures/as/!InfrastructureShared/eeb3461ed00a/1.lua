-- Threat: !InfrastructureShared
-- Name: eeb3461ed00a
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "start-clusterresource", 1, true) or string.find(l_0_0, "stop-clusterresource", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
