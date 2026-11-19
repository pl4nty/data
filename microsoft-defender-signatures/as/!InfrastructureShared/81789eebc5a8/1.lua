-- Threat: !InfrastructureShared
-- Name: 81789eebc5a8
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 40000 and hstrlog[1].matched and l_0_0 == 3 then
  return mp.INFECTED
end
return mp.CLEAN
