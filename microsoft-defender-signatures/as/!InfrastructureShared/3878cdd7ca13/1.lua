-- Threat: !InfrastructureShared
-- Name: 3878cdd7ca13
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if 1 <= l_0_0 and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
