-- Threat: !InfrastructureShared
-- Name: 3178f8ae861f
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if l_0_0 == 2 and mp.getfilesize() < 32000000 then
  return mp.INFECTED
end
return mp.CLEAN
