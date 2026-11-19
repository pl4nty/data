-- Threat: !InfrastructureShared
-- Name: a48fde1124e6
-- Type: 21

local l_0_0 = hstrlog[1].hitcount
local l_0_1 = hstrlog[2].hitcount
local l_0_2 = hstrlog[3].hitcount
local l_0_3 = hstrlog[4].hitcount
local l_0_4 = hstrlog[5].hitcount
local l_0_5 = hstrlog[6].hitcount
if 10 < l_0_0 or 10 < l_0_1 or 10 < l_0_2 or 10 < l_0_3 or 10 < l_0_4 or 10 < l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
