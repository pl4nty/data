-- Threat: !InfrastructureShared
-- Name: 1f78d10e01be
-- Type: 21

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = hstrlog[1].hitcount
end
if 3 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
