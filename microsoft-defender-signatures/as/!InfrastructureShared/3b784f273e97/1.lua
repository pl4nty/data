-- Threat: !InfrastructureShared
-- Name: 3b784f273e97
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if l_0_0 == 2 and mp.getfilesize() > 75000 and mp.getfilesize() < 82000 then
  return mp.INFECTED
end
return mp.CLEAN
