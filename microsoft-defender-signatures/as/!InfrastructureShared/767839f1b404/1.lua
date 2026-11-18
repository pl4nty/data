-- Threat: !InfrastructureShared
-- Name: 767839f1b404
-- Type: 21

local l_0_0 = 0
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[5].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[6].matched then
  l_0_0 = l_0_0 + 1
end
if 2 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
