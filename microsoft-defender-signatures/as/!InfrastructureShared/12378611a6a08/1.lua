-- Threat: !InfrastructureShared
-- Name: 12378611a6a08
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
if mp.getfilesize() < 1000000 and l_0_0 == 3 then
  return mp.INFECTED
end
return mp.CLEAN
