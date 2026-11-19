-- Threat: !InfrastructureShared
-- Name: 5b784a21e06c
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1024000 then
  return mp.INFECTED
end
local l_0_1 = 0
if hstrlog[1].matched then
  l_0_1 = hstrlog[1].hitcount
end
if hstrlog[2].matched or 1 < l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
