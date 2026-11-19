-- Threat: !InfrastructureShared
-- Name: 3a7808743b02
-- Type: 21

local l_0_0 = hstrlog[1].VA
local l_0_1 = hstrlog[2].VA
local l_0_2 = 0
if l_0_0 < l_0_1 then
  l_0_2 = l_0_1 - l_0_0
else
  l_0_2 = l_0_0 - l_0_1
end
if 160 < l_0_2 and l_0_2 < 256 then
  return mp.INFECTED
end
return mp.CLEAN
