-- Threat: !InfrastructureShared
-- Name: 19b3a2cb2482
-- Type: 21

local l_0_0 = string.lower(sigattr_head[1].utf8p2)
if string.find(l_0_0, "/x", 1, true) and string.find(l_0_0, "/s", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
