-- Threat: !InfrastructureShared
-- Name: 458fcb7a6bdb
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
if 10 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
