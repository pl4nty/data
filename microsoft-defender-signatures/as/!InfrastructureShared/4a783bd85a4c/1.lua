-- Threat: !InfrastructureShared
-- Name: 4a783bd85a4c
-- Type: 21

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + hstrlog[1].hitcount
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + hstrlog[2].hitcount
end
if 5 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
