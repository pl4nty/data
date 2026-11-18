-- Threat: !InfrastructureShared
-- Name: 9f783971ca33
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetHSTRCallerId()
if isnull(l_0_0) or mp.HSTR_CALLER_SMS ~= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = 0
if hstrlog[1].matched then
  l_0_1 = l_0_1 + 1
end
if hstrlog[2].matched then
  l_0_1 = l_0_1 + 1
end
local l_0_2 = 0
if hstrlog[3].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[4].matched then
  l_0_2 = l_0_2 + 1
end
local l_0_3 = 0
if hstrlog[5].matched then
  l_0_3 = l_0_3 + 1
end
if hstrlog[6].matched then
  l_0_3 = l_0_3 + 1
end
if 2 <= l_0_1 and 1 <= l_0_2 and l_0_3 == 2 then
  return mp.INFECTED
end
return mp.CLEAN
