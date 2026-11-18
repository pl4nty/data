-- Threat: !InfrastructureShared
-- Name: 17478a4e29534
-- Type: 21

local l_0_0 = 0
if hstrlog[6].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[7].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[8].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[9].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[10].matched then
  l_0_0 = l_0_0 + 2
end
if 3 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
