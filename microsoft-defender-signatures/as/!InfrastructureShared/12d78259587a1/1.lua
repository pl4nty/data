-- Threat: !InfrastructureShared
-- Name: 12d78259587a1
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 45000 and mp.getfilesize() > 20000 and l_0_0 == 4 then
  return mp.INFECTED
end
return mp.CLEAN
