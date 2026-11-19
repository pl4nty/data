-- Threat: !InfrastructureShared
-- Name: 4f786fb5158e
-- Type: 21

local l_0_0 = mp.getfilesize()
if not peattributes.isdll or 400000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = 0
if (hstrlog[1].matched or hstrlog[2].matched) and (hstrlog[3].matched or hstrlog[4].matched) then
  l_0_1 = hstrlog[1].hitcount
  l_0_2 = hstrlog[2].hitcount
  l_0_3 = hstrlog[3].hitcount
  l_0_4 = hstrlog[4].hitcount
end
if (50 < l_0_1 or 50 < l_0_2) and (20 < l_0_3 or 10 < l_0_4) then
  return mp.INFECTED
end
return mp.CLEAN
