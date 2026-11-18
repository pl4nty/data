-- Threat: !InfrastructureShared
-- Name: 7d785ee8f1cc
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 200000 and 1 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
