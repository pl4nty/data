-- Threat: !InfrastructureShared
-- Name: 5d787533dab6
-- Type: 21

local l_0_0 = mp.getfilesize()
if not peattributes.isdll or 500000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = 0
if hstrlog[1].matched and hstrlog[2].matched then
  l_0_1 = hstrlog[1].hitcount
  l_0_2 = hstrlog[2].hitcount
end
if l_0_1 == 2 and l_0_2 == 2 then
  return mp.INFECTED
end
return mp.CLEAN
