-- Threat: !InfrastructureShared
-- Name: 14578dff08b93
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
if hstrlog[5].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 1000000 and (hstrlog[1].matched or l_0_0 == 4) then
  return mp.INFECTED
end
return mp.CLEAN
