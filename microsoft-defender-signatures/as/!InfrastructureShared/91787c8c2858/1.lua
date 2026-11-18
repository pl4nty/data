-- Threat: !InfrastructureShared
-- Name: 91787c8c2858
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1024000 then
  return mp.INFECTED
end
local l_0_1 = 0
if hstrlog[1].matched then
  l_0_1 = hstrlog[1].hitcount
end
if 1 < l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
